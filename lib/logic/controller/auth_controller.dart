import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../routes/routes.dart';
import '../../utils/2.2 theme.dart';

class AuthController extends GetxController {
  bool isVisibitlty = false;
  bool isChechBox = false;
  var displayUserName = ''.obs;
  var disPlayUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
   var googleSignIn = GoogleSignIn();
   var isSignIn = false;
   final GetStorage  authBox = GetStorage();
   //to get data from firebase this storge from Emailgoogle
   User ? get userProfile => auth.currentUser;
   @override
  void onInit() {
   displayUserName.value = 
   (userProfile != null ? userProfile!.displayName : " ")!;

disPlayUserPhoto.value = 
   (userProfile != null ? userProfile!.photoURL : " ")!;

   displayUserEmail.value = 
   (userProfile != null ? userProfile!.email : " ")!;


    super.onInit();
  }

  void visibility() {
    isVisibitlty = !isVisibitlty;
    update();
  }

  void chechBox() {
    isChechBox = !isChechBox;
    update();
  }

  
// is method the sign in
  Future<void> signUpUsingFirsbase({
    required String name,
    required String email,
    required String password,
  }) 
  async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (value) {
          displayUserName.value = name;
          auth.currentUser!.updateDisplayName(name);
        },
      );
      update();
      Get.offNamed(Routes.mainscreen);
    }

    //دا الجزء الخاص بالخطاء
    on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: white,
      );
    }
  }



 // is mathod the log in
  Future<void> logInUsingFirsbase({
    required String email,
    required String password,
  }) 
  async {
    try {
      await auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        displayUserName.value = auth.currentUser!.displayName!;
      });


      isSignIn =true ;
      authBox.write("auth", isSignIn);

      update();
      Get.offNamed(Routes.mainscreen);

      //دا الجزء الخاص بالخطاء
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
            " Account does not exists for that $email.. Create your account by signing up..";
      } else if (error.code == 'wrong-password') {
        message = "Invalid password... Please try again ";
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: white,
      );
    }
  }



 

  void googleSignUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName!;
      disPlayUserPhoto.value = googleUser.photoUrl!;
      displayUserEmail.value=googleUser.email;


GoogleSignInAuthentication googleSignInAuthentication = 
await googleUser.authentication;

final AuthCredential credential = GoogleAuthProvider.credential(
  idToken: googleSignInAuthentication.idToken,
  accessToken: googleSignInAuthentication.accessToken,
);

await auth.signInWithCredential(credential);


      isSignIn =true ;
       authBox.write("auth", isSignIn);
      update();
      Get.offNamed(Routes.mainscreen);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: white,
      );
    }
  }



  void faceBookSignApp() {}



  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      update();
      Get.back();

      //دا الجزء الخاص بالخطاء
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
            " Account does not exists for that $email.. Create your account by signing up..";
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: white,
      );
    }
  }



  void signOutFromApp()async  {

    try{

  await auth.signOut();
 await googleSignIn.signOut();

displayUserName.value = '';
disPlayUserPhoto.value = '';
displayUserEmail.value='';
isSignIn =false ;
 authBox.remove("auth");
update();
Get.offNamed(Routes.welcomeScreen);

    }catch(error){

 Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: white,
      );


    }
  }
}

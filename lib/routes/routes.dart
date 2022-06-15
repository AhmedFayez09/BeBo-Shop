import 'package:final_project_3/logic/binding/product_binding.dart';
import 'package:final_project_3/view/screens/auth/log_in_screen.dart';
import 'package:final_project_3/view/screens/auth/sgin_up_screen.dart';
import 'package:final_project_3/view/screens/cart_screen.dart';
import 'package:final_project_3/view/screens/main_screen.dart';
import 'package:final_project_3/view/screens/welcome_screen.dart';
import 'package:get/get.dart';
import '../logic/binding/auth_binding.dart';
import '../logic/binding/main_binging.dart';
import '../view/screens/auth/forget_password_screen.dart';
import '../view/screens/payment_screen.dart';

class AppRoutes {
// initialRoute
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainscreen;
// getpage
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const welcomeScreen(),
    ),
    GetPage(
      name: Routes.LoginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.SginUpScreen,
      page: () => SginUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgetpasswordscreen,
      page: () => ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainscreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.cartscreen,
      page: () => CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.paymentScreen,
      page: () => PayMentScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
        MainBinding(),
      ],
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcome';
  static const LoginScreen = "/LoginScreen";
  static const SginUpScreen = "/SginUpScreen";
  static const forgetpasswordscreen = "/forgetpasswordscreen";
  static const mainscreen = "/mainscreen";
  static const cartscreen = "/cartscreen";
  static const paymentScreen = "/paymentScreen";
}

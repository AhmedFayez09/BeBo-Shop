import 'package:final_project_3/view/screens/categary_scerrn.dart';
import 'package:final_project_3/view/screens/favorite_screen.dart';
import 'package:final_project_3/view/screens/home_screen.dart';
import 'package:final_project_3/view/screens/setting_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController{

RxInt currentIndex = 0.obs;

final tabs = [

HomeScreen(),
CategoryScreen(),
FavoriteScreen(),
SettingsScreen(),

].obs;


final title = [
  "BeBo Shop",
  "Categories",
  "Favourites",
  "Settings"
].obs;





}
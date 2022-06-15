import 'dart:async';

import 'package:final_project_3/utils/my_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  var switchValue = false.obs;
  var storage = GetStorage();
  var langLocal = ene;

//this function will make the first element in word captil
  String capitalize(String profileName) {
    return profileName.split(" ").map((name) => name.capitalize).join(" ");
  }

//Language

  @override
  void onInit() async {
    super.onInit();
    langLocal = await getLanguage;
  }

  void saveLangauge(String lang) async {
    await storage.write("lang", lang);
  }
// possibility error = this sohve => FutureOr
  Future<String> get getLanguage async {
    return await storage.read("lang");
  }

  void changeLanguage(String typeLang) {
    saveLangauge(typeLang);
   if(langLocal == typeLang){
     return;
   }


   if(typeLang == frf){
     langLocal =frf ;
     saveLangauge(frf);
   }else if(typeLang == ara){
     langLocal =ara ;
     saveLangauge(ara);
   }else{
      langLocal =ene ;
     saveLangauge(ene);
   }
   update();
  }
}

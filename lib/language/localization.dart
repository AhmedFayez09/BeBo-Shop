import 'package:final_project_3/language/ar.dart';
import 'package:final_project_3/language/en.dart';
import 'package:final_project_3/language/fr.dart';
import 'package:get/get.dart';

import '../utils/my_string.dart';

class LocalizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}

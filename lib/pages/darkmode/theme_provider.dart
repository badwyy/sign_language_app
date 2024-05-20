

import 'package:flutter/material.dart';
import 'package:sign_lang_flut/pages/darkmode/themes.dart';

class Theme_provider with ChangeNotifier{
  ThemeData _themeData =lightMode;
  ThemeData get themeData => _themeData;
  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData==lightMode){
      themeData = darkMode;
    }else{
      themeData = lightMode;
    }
  }
}
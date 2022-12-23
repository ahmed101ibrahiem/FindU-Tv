

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SavedTheme {
  Future<int> getCacheTheme();
  Future <void>cacheTheme(int themeIndex);
}

class GetSavedTheme implements SavedTheme{

  @override
  Future<void> cacheTheme(int themeIndex) async{
    final sharedPref =await SharedPreferences.getInstance();
    sharedPref.setInt('themeSavedIndex', themeIndex);
  }

  @override
  Future<int> getCacheTheme()async {
    final sharedPref =await SharedPreferences.getInstance();
    final cacheThemeIndex= sharedPref.getInt(themeSavedIndex);
    if(cacheThemeIndex != null){
      return cacheThemeIndex;
    }else{
      return 0;
    }
  }

}
const String themeSavedIndex = 'Theme_Index';
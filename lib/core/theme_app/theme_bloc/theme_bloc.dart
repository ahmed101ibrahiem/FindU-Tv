import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/theme_app/app_theme.dart';

import '../save_theme/theme_cache_helper.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(InitialThemeState()) {
    on<ThemeEvent>((event, emit) async{
      if (event is GetThemeEvent){
       final themeIndex = await GetSavedTheme().getCacheTheme();
       final theme= AppTheme.values.firstWhere((element) => element.index == themeIndex);
       emit(LoadedThemeState(themeData: appThemeData[theme]!));
      }
      else if (event is ChangeThemeEvent){
       // event.theme.index;
      }
    });
  }
}

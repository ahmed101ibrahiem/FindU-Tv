part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class InitialThemeState extends ThemeState {
  @override
  List<Object> get props => [];
}


class LoadedThemeState extends ThemeState {
  final ThemeData themeData;

  const LoadedThemeState({required this.themeData});

  @override
  List<Object> get props => [themeData];
}
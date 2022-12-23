part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class GetThemeEvent extends ThemeEvent{
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}
class ChangeThemeEvent extends ThemeEvent{
  final ThemeData theme;

  const ChangeThemeEvent({required this.theme});
  @override
  // TODO: implement props
  List<Object?> get props =>[theme];

}

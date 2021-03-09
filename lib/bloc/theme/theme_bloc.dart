import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_flutter/bloc/theme/theme_event.dart';
import 'package:try_flutter/bloc/theme/theme_state.dart';
import 'package:try_flutter/settings/theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
            ThemeState(themeData: AppThemes.appThemeData[AppTheme.lightTheme]));

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeEvent) {
      yield ThemeState(themeData: AppThemes.appThemeData[event.appTheme]);
    }
  }
}

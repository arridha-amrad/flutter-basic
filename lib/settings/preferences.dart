import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:try_flutter/settings/theme.dart';

class Preferences {
  static SharedPreferences preferences;
  static const String KEY_SELECTED_THEME = 'key_selected_theme';

  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void savedTheme(AppTheme selectedTheme) {
    selectedTheme = selectedTheme ?? AppTheme.lightTheme;
    String theme = jsonEncode(selectedTheme.toString());
    preferences.setString(KEY_SELECTED_THEME, theme);
  }

  static AppTheme getTheme() {
    String theme = preferences.getString(KEY_SELECTED_THEME);
    return getThemeFromString(jsonDecode(theme)) ?? AppTheme.lightTheme;
  }

  static AppTheme getThemeFromString(String themeString) {
    for (AppTheme theme in AppTheme.values) {
      if (theme.toString() == themeString) {
        return theme;
      }
    }
    return null;
  }
}
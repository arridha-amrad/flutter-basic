import 'package:shared_preferences/shared_preferences.dart';
import 'package:try_flutter/model.dart';

class Preferences {
  Future savedSettings(Settings settings) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString("username", settings.username);
    await preferences.setBool("isEmployed", settings.isEmployed);
    await preferences.setInt("gender", settings.gender.index);
    await preferences.setStringList(
        "languages", settings.language.map((e) => e.index.toString()).toList());
  }

  Future<Settings> getSettings() async {
    final preferences = await SharedPreferences.getInstance();
    final username = preferences.getString("username") ?? "";
    final isEmployed = preferences.getBool("isEmployed") ?? false;
    final gender = Gender.values[preferences.getInt("gender") ?? 0];
    final languages = preferences.getStringList("languages") ?? <String>[];
    Set<Language> lang =
        languages.map((e) => Language.values[int.tryParse(e) ?? 0]).toSet();

    return Settings(
        gender: gender,
        username: username,
        isEmployed: isEmployed,
        language: lang);
  }
}

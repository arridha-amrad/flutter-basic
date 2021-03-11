enum Gender { MALE, FEMALE, OTHER }

enum Language { DART, TYPESCRIPT, KOTLIN, SWIFT }

class Settings {
  final Gender gender;
  final Set<Language> language;
  final String username;
  final bool isEmployed;

  Settings(
      {required this.gender,
      required this.language,
      required this.username,
      required this.isEmployed});
}

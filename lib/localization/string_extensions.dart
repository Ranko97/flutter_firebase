/// A simple placeholder that can be used to search all the hardcoded strings
/// in the code (useful to identify strings that need to be localized).
extension StringHardcoded on String {
  String get hardcoded => this;
}

/// Extension method to call TranslationService.
extension StringTranslate on String {
  // static TranslationRepository? _translationRepo;

  // void initTranslations(WidgetRef ref) {
  //   _translationRepo = ref.watch(translationRepoProvider);
  // }

  // String get translate => _translationRepo?.get(this) ?? this;

  String get translate => this;

  // bool get translationKeyExists => _translationRepo?.keyExists(this) ?? false;
}

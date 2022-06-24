// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for English (`en`).
class HereSdkConsentLocalizationsEn extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get consent_noThanks => 'No, thanks';

  @override
  String get consent_okSure => 'OK, sure';

  @override
  String get consent_title =>
      'This app may collect info about your surroundings such as nearby Wi-Fi and mobile phone signals';

  @override
  String get consent_message =>
      'With your permission, this info is sent to HERE to help improve HERE services. This info does not identify you, and HERE will only retain anonymised info.';

  @override
  String get consent_mayChangeMind => 'You can cancel your consent at any time';

  @override
  String get consent_learnMore => 'Learn more about privacy practices at HERE';

  @override
  String get consent_question => 'Would you be willing to provide HERE with this info?';
}

/// The translations for English, as used in the United States (`en_US`).
class HereSdkConsentLocalizationsEnUs extends HereSdkConsentLocalizationsEn {
  HereSdkConsentLocalizationsEnUs() : super('en_US');

  @override
  String get consent_noThanks => 'No, thanks';

  @override
  String get consent_okSure => 'OK, sure';

  @override
  String get consent_title =>
      'This app may collect info about your surroundings such as nearby Wi-Fi and cellular signals';

  @override
  String get consent_message =>
      'With your permission, this info is sent to HERE to help improve HERE services. This info does not identify you, and HERE will only retain anonymized info.';

  @override
  String get consent_mayChangeMind => 'You can cancel your consent at any time';

  @override
  String get consent_learnMore => 'Learn more about privacy practices at HERE';

  @override
  String get consent_question => 'Would you be willing to provide HERE with this info?';
}

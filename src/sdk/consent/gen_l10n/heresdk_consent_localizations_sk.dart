// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Slovak (`sk`).
class HereSdkConsentLocalizationsSk extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get consent_noThanks => 'Nie, ďakujem';

  @override
  String get consent_okSure => 'OK, určite';

  @override
  String get consent_title =>
      'Aplikácia môže zhromažďovať informácie o vašom okolí, napríklad o blízkych sieťach Wi-Fi a celulárnych signáloch';

  @override
  String get consent_message =>
      'Ak súhlasíte, tieto informácie budú zasielané HERE s cieľom zlepšovania služieb HERE. Na základe týchto informácií vás nie je možné identifikovať a HERE uchová iba anonymizované informácie.';

  @override
  String get consent_mayChangeMind => 'Svoj súhlas môžete kedykoľvek odvolať';

  @override
  String get consent_learnMore => 'Ďalšie informácie o zásadách ochrany súkromia HERE';

  @override
  String get consent_question => 'Súhlasíte so zdieľaním týchto informácií HERE?';
}

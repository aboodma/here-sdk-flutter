// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for French (`fr`).
class HereSdkConsentLocalizationsFr extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get consent_noThanks => 'Non, merci';

  @override
  String get consent_okSure => 'Oui, activer';

  @override
  String get consent_title =>
      'La présente application peut recueillir des renseignements sur votre environnement, comme le Wi-Fi et les signaux cellulaires à proximité';

  @override
  String get consent_message =>
      'Avec votre permission, ces renseignements sont envoyés à HERE pour aider à améliorer les services HERE. Ces renseignements ne permettent pas de vous identifier et HERE ne conservera que des renseignements anonymisés.';

  @override
  String get consent_mayChangeMind => 'Vous pouvez annuler votre consentement à tout moment.';

  @override
  String get consent_learnMore => 'En savoir plus sur les pratiques de confidentialité de HERE';

  @override
  String get consent_question => 'Seriez-vous disposé à fournir ces renseignements à HERE ?';
}

/// The translations for French, as used in Canada (`fr_CA`).
class HereSdkConsentLocalizationsFrCa extends HereSdkConsentLocalizationsFr {
  HereSdkConsentLocalizationsFrCa() : super('fr_CA');

  @override
  String get consent_noThanks => 'Non, merci';

  @override
  String get consent_okSure => 'D\\\'accord, activer';

  @override
  String get consent_title =>
      'La présente application peut recueillir des renseignements sur votre environnement, comme le Wi-Fi et les signaux cellulaires à proximité';

  @override
  String get consent_message =>
      'Avec votre permission, ces renseignements sont envoyés à HERE pour aider à améliorer les services HERE. Ces renseignements ne permettent pas de vous identifier et HERE ne conservera que des renseignements anonymisés.';

  @override
  String get consent_mayChangeMind => 'Vous pouvez annuler votre consentement à tout moment';

  @override
  String get consent_learnMore => 'En savoir plus sur les pratiques de confidentialité de HERE';

  @override
  String get consent_question => 'Seriez-vous disposé à fournir ces renseignements à HERE?';
}

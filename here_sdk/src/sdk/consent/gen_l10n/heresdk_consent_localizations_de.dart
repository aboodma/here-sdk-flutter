// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for German (`de`).
class HereSdkConsentLocalizationsDe extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get consent_noThanks => 'Nein danke';

  @override
  String get consent_okSure => 'Na klar';

  @override
  String get consent_title =>
      'Diese App sammelt ggf. Informationen zu Ihrer Umgebung wie nahe gelegene WLAN- und Mobilfunkverbindungen.';

  @override
  String get consent_message =>
      'Mit Ihrer Erlaubnis werden diese Informationen zur Verbesserung der HERE-Dienste an HERE gesendet. Sie können anhand dieser Informationen nicht persönlich identifiziert werden. HERE speichert die Informationen ausschließlich in anonymisierter Form.';

  @override
  String get consent_mayChangeMind => 'Sie können Ihre Einwilligung jederzeit widerrufen.';

  @override
  String get consent_learnMore => 'Weitere Informationen zu Datenschutzmaßnahmen bei HERE';

  @override
  String get consent_question =>
      'Sind Sie damit einverstanden, dass diese Informationen HERE zur Verfügung gestellt werden?';
}

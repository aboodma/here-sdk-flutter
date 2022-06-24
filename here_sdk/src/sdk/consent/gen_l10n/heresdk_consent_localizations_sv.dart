// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Swedish (`sv`).
class HereSdkConsentLocalizationsSv extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get consent_noThanks => 'Nej tack';

  @override
  String get consent_okSure => 'Javisst';

  @override
  String get consent_title =>
      'Den här appen kan samla in information från din omgivning, exempelvis wi-fi-signaler och mobilsignaler';

  @override
  String get consent_message =>
      'Med din tillåtelse skickas den här informationen till HERE och används för att förbättra HERE:s tjänster. Informationen används inte för att identifiera dig personligen, och HERE sparar endast information i anonymiserad form.';

  @override
  String get consent_mayChangeMind => 'Du kan återkalla ditt samtycke när som helst';

  @override
  String get consent_learnMore => 'Läs mer om de sekretessrutiner som tillämpas av HERE';

  @override
  String get consent_question => 'Vill du lämna denna information till HERE?';
}

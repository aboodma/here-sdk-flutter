// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Italian (`it`).
class HereSdkConsentLocalizationsIt extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get consent_noThanks => 'No, grazie';

  @override
  String get consent_okSure => 'OK';

  @override
  String get consent_title =>
      'Questa app può raccogliere informazioni su ciò che ti circonda, ad esempio segnali Wi-Fi e cellulari';

  @override
  String get consent_message =>
      'Con la tua autorizzazione, queste informazioni vengono inviate a HERE per contribuire a migliorare i servizi HERE. Queste informazioni non ti identifica e HERE conserverà solo informazioni anonime.';

  @override
  String get consent_mayChangeMind => 'Puoi annullare la tua autorizzazione in qualsiasi momento.';

  @override
  String get consent_learnMore => 'Maggiori informazioni sulle pratiche relative alla privacy in HERE';

  @override
  String get consent_question => 'Sei interessato a fornire a HERE queste informazioni?';
}

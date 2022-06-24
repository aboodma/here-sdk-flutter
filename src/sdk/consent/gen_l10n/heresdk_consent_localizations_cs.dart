// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Czech (`cs`).
class HereSdkConsentLocalizationsCs extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get consent_noThanks => 'Ne, děkuji';

  @override
  String get consent_okSure => 'OK, jistě';

  @override
  String get consent_title =>
      'Aplikace může shromažďovat informace o vašem okolí, například o blízkých sítích Wi-Fi a signálech z mobilních sítí';

  @override
  String get consent_message =>
      'Pokud souhlasíte, tyto informace budou zasílány HERE za účelem zlepšování služeb HERE. Na základě těchto informací není možná vaše identifikace a HERE uchová pouze anonymizované informace.';

  @override
  String get consent_mayChangeMind => 'Svůj souhlas můžete kdykoli odvolat';

  @override
  String get consent_learnMore => 'Další informace o zásadách ochrany soukromí HERE';

  @override
  String get consent_question => 'Souhlasíte se sdílením těchto informací HERE?';
}

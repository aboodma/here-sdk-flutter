// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Hebrew (`he`).
class HereSdkConsentLocalizationsHe extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get consent_noThanks => 'לא, תודה';

  @override
  String get consent_okSure => 'כן, בטח';

  @override
  String get consent_title => 'ייתכן שיישום זה יאסוף מידע על סביבתך, כגון אותות של רשתות Wi-Fi ורשתות סלולריות סמוכות';

  @override
  String get consent_message =>
      'באישורך, מידע זה יישלח אל HERE כד לסייע בשיפור השירותים של HERE. מידע זו אינו משמש כדי לזהות אותך ו-HERE ישמור מידע אנונימי בלבד.';

  @override
  String get consent_mayChangeMind => 'תוכל לבטל את הסכמתך בכל עת';

  @override
  String get consent_learnMore => 'מידע על נהלי הפרטיות של HERE';

  @override
  String get consent_question => 'האם אתה מסכים לספק ל-HERE מידע זה?';
}

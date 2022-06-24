// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Romanian Moldavian Moldovan (`ro`).
class HereSdkConsentLocalizationsRo extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get consent_noThanks => 'Nu, mersi';

  @override
  String get consent_okSure => 'OK, sigur';

  @override
  String get consent_title =>
      'Această aplicație poate culege informații despre zona în care sunteți, cum ar fi rețelele Wi-Fi din apropiere sau semnalele celulare';

  @override
  String get consent_message =>
      'Cu permisiunea dvs., aceste informații sunt trimise către HERE pentru îmbunătățirea serviciilor HERE. Aceste informații nu vă identifică și HERE va reține doar informații anonime.';

  @override
  String get consent_mayChangeMind => 'Vă puteți anula consimțământul în orice moment';

  @override
  String get consent_learnMore => 'Aflați mai multe despre politicile de confidențialitate de la HERE';

  @override
  String get consent_question => 'Doriți să furnizați HERE aceste informații?';
}

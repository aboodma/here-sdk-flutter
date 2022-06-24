// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Ukrainian (`uk`).
class HereSdkConsentLocalizationsUk extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get consent_noThanks => 'Ні, дякую';

  @override
  String get consent_okSure => 'Так, звісно';

  @override
  String get consent_title =>
      'Ця програма може збирати відомості про ваше оточення, наприклад про мережі Wi-Fi і сигнали мобільних мереж поблизу';

  @override
  String get consent_message =>
      'З вашого дозволу ці відомості надсилатимуться до HERE з метою покращення послуг HERE. Ця інформація не дозволяє ідентифікувати вас, а HERE отримуватиме її лише в анонімізованому вигляді.';

  @override
  String get consent_mayChangeMind => 'Ви можете відкликати свою згоду будь-коли';

  @override
  String get consent_learnMore => 'Дізнатися більше про політику конфіденційності HERE';

  @override
  String get consent_question => 'Ви бажаєте надати HERE ці відомості?';
}

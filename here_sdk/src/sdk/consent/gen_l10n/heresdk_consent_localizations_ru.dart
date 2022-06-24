// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Russian (`ru`).
class HereSdkConsentLocalizationsRu extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get consent_noThanks => 'Нет, спасибо';

  @override
  String get consent_okSure => 'Да, конечно';

  @override
  String get consent_title =>
      'Это приложение может собирать сведения о вашем окружении, например о расположенных поблизости сетях Wi-Fi и сигналах сотовой связи';

  @override
  String get consent_message =>
      'В случае согласия эти сведения будут отправляться в HERE для повышения качества услуг. Такие данные не позволяют установить вашу личность. HERE хранит только анонимные данные.';

  @override
  String get consent_mayChangeMind => 'Вы можете отозвать свое согласие в любой момент.';

  @override
  String get consent_learnMore => 'Узнать больше о правилах конфиденциальности в HERE';

  @override
  String get consent_question => 'Вы хотите предоставить HERE эти сведения?';
}

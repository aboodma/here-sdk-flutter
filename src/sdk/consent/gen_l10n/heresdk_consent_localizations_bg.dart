// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Bulgarian (`bg`).
class HereSdkConsentLocalizationsBg extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get consent_noThanks => 'Не, благодаря';

  @override
  String get consent_okSure => 'Да, разбира се';

  @override
  String get consent_title =>
      'Това приложение може да събира информация за заобикалящите ви неща, като например близки Wi-Fi и клетъчни сигнали';

  @override
  String get consent_message =>
      'С вашето разрешение тази информация е изпратена на HERE, за да помогне за подобряването на услугите на HERE. Тази информация не ви идентифицира и HERE ще запази само анонимизирана информация.';

  @override
  String get consent_mayChangeMind => 'Можете да оттеглите съгласието си по всяко време';

  @override
  String get consent_learnMore => 'Научете повече за политиките за поверителност на HERE';

  @override
  String get consent_question => 'Бихте ли споделили тази информация с HERE?';
}

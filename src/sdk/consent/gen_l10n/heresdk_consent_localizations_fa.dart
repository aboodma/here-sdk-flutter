// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Persian (`fa`).
class HereSdkConsentLocalizationsFa extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get consent_noThanks => 'نه، متشکرم';

  @override
  String get consent_okSure => 'باشه، حتماً';

  @override
  String get consent_title =>
      'این برنامه ممکن است اطلاعاتی درباره محیط اطراف شما از قبیل سیگنال‌های Wi-Fi و تلفن همراه نزدیک را جمع‌آوری کند';

  @override
  String get consent_message =>
      'با مجوز شما، برای بهبود خدمات HERE، این اطلاعات به HERE ارسال شده است. این اطلاعات هویت شما را شناسایی نمی‌کند و HERE فقط اطلاعات ناشناس را حفظ می‌کند.';

  @override
  String get consent_mayChangeMind => 'هر زمان بخواهید می‌توانید رضایت خود را لغو کنید';

  @override
  String get consent_learnMore => 'کسب اطلاعات بیشتر درباره روش‌های حفظ حریم خصوصی در HERE';

  @override
  String get consent_question => 'آیا مایلید این اطلاعات را در اختیار HERE بگذارید؟';
}

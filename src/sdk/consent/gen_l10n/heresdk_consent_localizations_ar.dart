// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Arabic (`ar`).
class HereSdkConsentLocalizationsAr extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get consent_noThanks => 'لا، شكرًا';

  @override
  String get consent_okSure => 'موافق بالتأكيد';

  @override
  String get consent_title => 'قد يجمع هذا التطبيق معلومات حول ما يحيط بك، مثل شبكات Wi-Fi وإشارات الخلوي القريبة';

  @override
  String get consent_message =>
      'بعد موافقتك، يتم إرسال هذه المعلومات إلى HERE للمساعدة على تحسين خدمات HERE. لا تحدد هذه المعلومات هويتك، وسوف تحتفظ HERE بمعلومات مجهولة الهوية فقط.';

  @override
  String get consent_mayChangeMind => 'يمكنك إلغاء موافقتك في أي وقت';

  @override
  String get consent_learnMore => 'تعرف على المزيد حول ممارسات الخصوصية في HERE';

  @override
  String get consent_question => 'هل ستكون مستعدًا لتقديم هذه المعلومات إلى HERE؟';
}

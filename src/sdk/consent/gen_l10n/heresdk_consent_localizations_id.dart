// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Indonesian (`id`).
class HereSdkConsentLocalizationsId extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get consent_noThanks => 'Tidak, terima kasih';

  @override
  String get consent_okSure => 'OK, tentu';

  @override
  String get consent_title =>
      'Aplikasi ini bisa mengumpulkan info tentang sekitar ANda seperti Wi-Fi dan sinyal seluler di sekiar';

  @override
  String get consent_message =>
      'Atas seizin Anda, info ini akan dikirim ke HERE untuk membantu meningkatkan layanan HERE. Info ini tidak mengindetifikasi Anda, dan HERE hanya akan menyimpan info secara anonim.';

  @override
  String get consent_mayChangeMind => 'Anda dapat membatalkan persetujuan Anda kapan saja';

  @override
  String get consent_learnMore => 'Pelajari selengkapnya tentang praktik privasi di HERE';

  @override
  String get consent_question => 'Maukah Anda memberikan info ini kepada HERE?';
}

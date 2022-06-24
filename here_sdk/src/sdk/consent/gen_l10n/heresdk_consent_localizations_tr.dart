// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Turkish (`tr`).
class HereSdkConsentLocalizationsTr extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get consent_noThanks => 'Hayır, teşekkürler';

  @override
  String get consent_okSure => 'Evet, tabi';

  @override
  String get consent_title =>
      'Bu uygulama, etrafınızdakiler (yakındaki Wi-Fi sinyalleri ve hücresel sinyaller gibi) hakkında bilgi toplayabilir';

  @override
  String get consent_message =>
      'İzninizle, HERE hizmetlerini iyileştirmeye yardımcı olmak amacıyla bu bilgiler HERE\\\'a gönderilir. Bu bilgiler sizi tanımlamaz ve HERE yalnızca anonim bilgileri saklar.';

  @override
  String get consent_mayChangeMind => 'Onayınızı istediğiniz zaman iptal edebilirsiniz';

  @override
  String get consent_learnMore => 'HERE\\\'daki gizlilik uygulamaları hakkında daha fazla bilgi edinin';

  @override
  String get consent_question => 'HERE ile bu bilgileri paylaşmak istiyor musunuz?';
}

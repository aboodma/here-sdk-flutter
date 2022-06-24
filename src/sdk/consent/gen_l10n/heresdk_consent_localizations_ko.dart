// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Korean (`ko`).
class HereSdkConsentLocalizationsKo extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get consent_noThanks => '아니요';

  @override
  String get consent_okSure => '예';

  @override
  String get consent_title => '이 앱에서 근처의 Wi-Fi 및 무선 통신 신호 같은 주변 정보를 수집할 수도 있습니다';

  @override
  String get consent_message =>
      '허가해 주시면 이 정보가 HERE로 전송되어 HERE 서비스 개선에 도움이 됩니다. 이 정보는 신원 확인이 안 되며, HERE에서도 익명 정보로만 취급할 것입니다.';

  @override
  String get consent_mayChangeMind => '동의를 언제라도 취소하실 수 있습니다';

  @override
  String get consent_learnMore => 'HERE의 개인정보보호 업무에 대해 알아보기';

  @override
  String get consent_question => '이 정보를 HERE로 제공해 주시겠습니까?';
}

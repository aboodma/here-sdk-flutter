// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Chinese (`zh`).
class HereSdkConsentLocalizationsZh extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get consent_noThanks => '不用，谢谢';

  @override
  String get consent_okSure => '开启';

  @override
  String get consent_title => '本应用程序可能会收集您周边环境的信息，如附近的 Wi-Fi 和移动数据信号。';

  @override
  String get consent_message => '经过您的同意，本信息将会发送至 HERE，用于帮助改善 HERE 服务。此信息不会用于识别您的身份，HERE 只会保留匿名信息。';

  @override
  String get consent_mayChangeMind => '您可以随时撤销同意';

  @override
  String get consent_learnMore => '了解更多有关 HERE 隐私政策的信息';

  @override
  String get consent_question => '您是否愿意向 HERE 提供此信息？';
}

/// The translations for Chinese, as used in Hong Kong (`zh_HK`).
class HereSdkConsentLocalizationsZhHk extends HereSdkConsentLocalizationsZh {
  HereSdkConsentLocalizationsZhHk() : super('zh_HK');

  @override
  String get consent_noThanks => '不用，謝謝';

  @override
  String get consent_okSure => '當然好';

  @override
  String get consent_title => '此應用程式可收集有關周遭環境的資訊，例如附近的 Wi-Fi 和流動數據信號';

  @override
  String get consent_message => '在您的許可下，有關資訊會傳輸至 HERE，以協助改善 HERE 的服務。此資訊無法識別您的身分，且 HERE 僅會保留匿名化資訊。';

  @override
  String get consent_mayChangeMind => '您可隨時撤銷同意';

  @override
  String get consent_learnMore => '進一步了解 HERE 的私隱方針';

  @override
  String get consent_question => '請問您是否願意向 HERE 提供此資訊？';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class HereSdkConsentLocalizationsZhTw extends HereSdkConsentLocalizationsZh {
  HereSdkConsentLocalizationsZhTw() : super('zh_TW');

  @override
  String get consent_noThanks => '不，謝謝';

  @override
  String get consent_okSure => '當然好';

  @override
  String get consent_title => '此應用程式可收集周遭環境的資訊，例如附近的 Wi-Fi 和行動數據訊號';

  @override
  String get consent_message => '在您的許可之下，此資訊會傳送至 HERE，以協助改善 HERE 服務。此資訊不會識別您的身分，且 HERE 只會保留匿名化資訊。';

  @override
  String get consent_mayChangeMind => '您隨時可以取消同意';

  @override
  String get consent_learnMore => '進一步瞭解 HERE 的隱私權做法';

  @override
  String get consent_question => '您是否願意向 HERE 提供此資訊？';
}

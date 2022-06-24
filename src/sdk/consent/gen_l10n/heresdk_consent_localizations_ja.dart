// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Japanese (`ja`).
class HereSdkConsentLocalizationsJa extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get consent_noThanks => '不要です';

  @override
  String get consent_okSure => '使用します';

  @override
  String get consent_title => 'このアプリは近くのWi-Fiや携帯電話の信号など、お客様の周辺に関する情報を収集する場合があります。';

  @override
  String get consent_message =>
      'お客様が許可すると、この情報はHEREに送信され、HEREのサービスの改善に役立てられます。この情報によりお客様が特定されることはなく、HEREが保有するのは匿名の情報のみです。';

  @override
  String get consent_mayChangeMind => 'お客様はこの同意をいつでもキャンセルできます';

  @override
  String get consent_learnMore => 'HEREのプライバシー方針について詳しく知る';

  @override
  String get consent_question => 'HERE にこれらの情報を提供してもよろしいですか？';
}

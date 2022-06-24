// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Thai (`th`).
class HereSdkConsentLocalizationsTh extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get consent_noThanks => 'ไม่ล่ะ ขอบคุณ';

  @override
  String get consent_okSure => 'โอเค ทำไปเลย';

  @override
  String get consent_title =>
      'แอปนี้อาจเก็บรวบรวมข้อมูลเกี่ยวกับสภาพแวดล้อมรอบตัวคุณ เช่น สัญญาณ Wi-Fi และเซลลูล่าร์ในบริเวณใกล้เคียง';

  @override
  String get consent_message =>
      'ด้วยยความยินยอมของคุณ ข้อมูลนี้จะถูกส่งไปที่ HERE เพื่อช่วยปรับปรุงบริการของ HERE ข้อมูลนี้จะไม่ระบุตัวตนของคุณ และ HERE จะเก็บข้อมูลที่ไม่ระบุชื่อไว้เท่านั้น';

  @override
  String get consent_mayChangeMind => 'คุณขอยกเลิกความยินยอมของคุณได้ทุกเมื่อ';

  @override
  String get consent_learnMore => 'เรียนรู้เพิ่มเติมเกี่ยวกับการปฏิบัติด้านความเป็นส่วนตัวที่ HERE';

  @override
  String get consent_question => 'คุณยินดีที่จะให้ข้อมูลนี้กับ HERE หรือไม่?';
}

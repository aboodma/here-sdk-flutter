// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Hindi (`hi`).
class HereSdkConsentLocalizationsHi extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get consent_noThanks => 'जी नहीं, धन्यवाद';

  @override
  String get consent_okSure => 'ठीक है, ज़रूर';

  @override
  String get consent_title =>
      'इस ऐप द्वारा आपके आस-पास की जानकारी को इकठ्ठा किया जा सकता है, जैसे कि नज़दीकी वाई-फ़ाई और मोबाइल सिग्नल';

  @override
  String get consent_message =>
      'आपकी अनुमति से, यह जानकारी HERE के पास भेजी जाती है, ताकि HERE सेवाओं को बेहतर बनाने में मदद मिल सके। इस जानकारी से आपकी पहचान नहीं होती, और HERE इस जानकारी को गुप्त रखेगा।';

  @override
  String get consent_mayChangeMind => 'आप किसी भी समय अपनी सहमति को रद्द कर सकते हैं';

  @override
  String get consent_learnMore => 'HERE की गोपनीयता प्रक्रियाओं के बारे में ज़्यादा जानें';

  @override
  String get consent_question => 'क्या आप HERE को यह जानकारी देना चाहेंगे?';
}

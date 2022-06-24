// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Dutch Flemish (`nl`).
class HereSdkConsentLocalizationsNl extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get consent_noThanks => 'Nee, bedankt';

  @override
  String get consent_okSure => 'OK, natuurlijk';

  @override
  String get consent_title =>
      'Deze app kan info verzamelen over je omgeving, zoals Wi-Fi- en mobiele telefoonsignalen in de buurt.';

  @override
  String get consent_message =>
      'Met jouw toestemming wordt deze info verzonden naar HERE voor verbetering van HERE-diensten. Deze info identificeert jou niet en HERE slaat alleen geanonimiseerde info op.';

  @override
  String get consent_mayChangeMind => 'Je kunt je toestemming op elk moment annuleren';

  @override
  String get consent_learnMore => 'Meer informatie over privacypraktijken bij HERE';

  @override
  String get consent_question => 'Wil je deze info met HERE delen?';
}

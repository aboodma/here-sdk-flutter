// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Norwegian Bokmål (`nb`).
class HereSdkConsentLocalizationsNb extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get consent_noThanks => 'Nei takk';

  @override
  String get consent_okSure => 'OK, helt i orden';

  @override
  String get consent_title =>
      'Denne appen kan samle inn informasjon om omgivelsene dine, for eksempel Wi-Fi- og mobilsignaler i nærheten';

  @override
  String get consent_message =>
      'Med din tillatelse blir denne informasjonen sendt til HERE for å bidra til å forbedre HEREs tjenester. Denne informasjonen identifiserer deg ikke, og HERE vil bare beholde anonymisert informasjon.';

  @override
  String get consent_mayChangeMind => 'Du kan trekke tilbake samtykket ditt når som helst';

  @override
  String get consent_learnMore => 'Les mer om HEREs retningslinjer for personvern';

  @override
  String get consent_question => 'Er du villig til å gi HERE denne informasjonen?';
}

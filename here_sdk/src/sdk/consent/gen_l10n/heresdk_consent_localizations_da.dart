// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Danish (`da`).
class HereSdkConsentLocalizationsDa extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get consent_noThanks => 'Nej tak';

  @override
  String get consent_okSure => 'OK, helt i orden';

  @override
  String get consent_title =>
      'Denne app vil muligvis indsamle oplysninger om dine omgivelser, f.eks. trådløse netværk i nærheden og mobilsignaler';

  @override
  String get consent_message =>
      'Med din tilladelse vil disse oplysninger blive sendt til HERE med henblik på at hjælpe HERE med at forbedre sine tjenester. Disse oplysninger identificerer ikke dig, og HERE vil kun opbevare anonymiserede oplysninger.';

  @override
  String get consent_mayChangeMind => 'Du kan tilbagekalde dit samtykke når som helst';

  @override
  String get consent_learnMore => 'Få mere at vide om privatlivspolitikken hos HERE';

  @override
  String get consent_question => 'Ønsker du at informere HERE om dette?';
}

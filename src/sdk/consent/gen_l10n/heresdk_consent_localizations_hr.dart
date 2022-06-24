// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Croatian (`hr`).
class HereSdkConsentLocalizationsHr extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get consent_noThanks => 'Ne, hvala';

  @override
  String get consent_okSure => 'Da, naravno';

  @override
  String get consent_title =>
      'Ova aplikacija može prikupljati podatke o vašem okruženju, npr. o Wi-Fi mrežama i signalima mobilne mreže';

  @override
  String get consent_message =>
      'Uz vaše se dopuštenje ti podaci šalju tvrtki HERE radi poboljšanja usluga te tvrtke. Ti se podaci ne koriste da bi vas se identificiralo, a HERE zadržava isključivo anonimne podatke.';

  @override
  String get consent_mayChangeMind => 'Svoje dopuštenje možete povući u bilo kojem trenutku';

  @override
  String get consent_learnMore => 'Saznajte više o pravilima zaštite privatnosti tvrtke HERE';

  @override
  String get consent_question => 'Jeste li voljni učiniti te podatke dostupnima tvrtki HERE?';
}

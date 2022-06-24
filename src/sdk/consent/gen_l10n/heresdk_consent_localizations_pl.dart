// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Polish (`pl`).
class HereSdkConsentLocalizationsPl extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get consent_noThanks => 'Nie, dziękuję';

  @override
  String get consent_okSure => 'Jasne';

  @override
  String get consent_title =>
      'Ta aplikacja może zbierać informacje o otoczeniu, np. o sieciach Wi-Fi w pobliżu i sygnałach sieci komórkowej';

  @override
  String get consent_message =>
      'Jeśli wyrazisz na to zgodę, te informacje będą wysyłane do firmy HERE, aby pomóc ulepszyć usługi HERE. Nie można zidentyfikować Cię za pomocą tych informacji, a firma HERE będzie przechowywać tylko anonimizowane informacje.';

  @override
  String get consent_mayChangeMind => 'W dowolnym momencie możesz wycofać zgodę';

  @override
  String get consent_learnMore => 'Dowiedz się więcej o zasadach ochrony prywatności w firmie HERE';

  @override
  String get consent_question => 'Czy zgadzasz się na udostępnianie tych informacji firmie HERE?';
}

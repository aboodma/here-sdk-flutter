// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Finnish (`fi`).
class HereSdkConsentLocalizationsFi extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get consent_noThanks => 'Ei kiitos';

  @override
  String get consent_okSure => 'Kyllä';

  @override
  String get consent_title =>
      'Tämä sovellus saattaa kerätä ympäristöstäsi tietoja, esimerkiksi lähellä olevista WLAN- ja mobiiliverkkosignaaleista';

  @override
  String get consent_message =>
      'Jos annat siihen luvan, nämä tiedot lähetetään HERE:lle palveluiden kehittämistä varten. Sinua ei voida yksilöidä tietojen perusteella. HERE säilyttää ainoastaan nimettömiä tietoja.';

  @override
  String get consent_mayChangeMind => 'Voit peruuttaa suostumuksesi koska tahansa';

  @override
  String get consent_learnMore => 'Lisätietoja HERE-palvelun tietosuojakäytännöistä';

  @override
  String get consent_question => 'Haluatko antaa nämä tiedot HERE-palvelulle?';
}

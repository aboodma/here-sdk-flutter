// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Portuguese (`pt`).
class HereSdkConsentLocalizationsPt extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get consent_noThanks => 'Não, obrigado';

  @override
  String get consent_okSure => 'OK';

  @override
  String get consent_title =>
      'Esta aplicação pode recolher informações sobre o seu ambiente, como Wi-Fi e sinais celulares nas proximidades';

  @override
  String get consent_message =>
      'Com a sua autorização, estas informações são enviadas à HERE para ajudar a melhorar os nossos serviços. Estas informações não o identificam pessoalmente e a HERE apenas conservará informações anónimas.';

  @override
  String get consent_mayChangeMind => 'Pode cancelar o seu consentimento em qualquer momento';

  @override
  String get consent_learnMore => 'Obtenha mais informações sobre as práticas de privacidade na HERE';

  @override
  String get consent_question => 'Estaria disposto a facultar esta informação à HERE?';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class HereSdkConsentLocalizationsPtBr extends HereSdkConsentLocalizationsPt {
  HereSdkConsentLocalizationsPtBr() : super('pt_BR');

  @override
  String get consent_noThanks => 'Não, obrigado';

  @override
  String get consent_okSure => 'Ok, claro';

  @override
  String get consent_title =>
      'Este aplicativo pode coletar informações sobre os seus arredores, tais como sinais de Wi-Fi e de celular próximos';

  @override
  String get consent_message =>
      'Com a sua permissão, essas informações são enviadas à HERE para ajudar a melhorar os nossos serviços. Elas não identificam você e a HERE as manterá anônimas.';

  @override
  String get consent_mayChangeMind => 'Você pode cancelar o seu consentimento a qualquer momento';

  @override
  String get consent_learnMore => 'Saiba mais sobre práticas de privacidade na HERE';

  @override
  String get consent_question => 'Você aceitaria fornecer essas informações à HERE?';
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Spanish Castilian (`es`).
class HereSdkConsentLocalizationsEs extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get consent_noThanks => 'No, gracias';

  @override
  String get consent_okSure => 'Sí, claro';

  @override
  String get consent_title =>
      'Esta aplicación puede recopilar información sobre su entorno, como las Wi-Fi cercanas y señales de móviles';

  @override
  String get consent_message =>
      'Con su permiso, esta información se envía a HERE para ayudar a mejorar sus servicios. Esta información no lo identifica personalmente y HERE solo conservará información anónima.';

  @override
  String get consent_mayChangeMind => 'Puede cancelar su consentimiento en cualquier momento';

  @override
  String get consent_learnMore => 'Más información sobre las prácticas de privacidad en HERE';

  @override
  String get consent_question => '¿Estaría dispuesto a proporcionar esta información a HERE?';
}

/// The translations for Spanish Castilian, as used in the United States (`es_US`).
class HereSdkConsentLocalizationsEsUs extends HereSdkConsentLocalizationsEs {
  HereSdkConsentLocalizationsEsUs() : super('es_US');

  @override
  String get consent_noThanks => 'No, gracias';

  @override
  String get consent_okSure => 'Por supuesto';

  @override
  String get consent_title =>
      'Esta aplicación puede recopilar información sobre su entorno, como Wi-Fi cercano y señales celulares';

  @override
  String get consent_message =>
      'Con su permiso, esta información se envía a HERE para ayudar a mejorar sus servicios. Esta información no lo identifica personalmente y HERE solo retendrá información anónima.';

  @override
  String get consent_mayChangeMind => 'Puede cancelar su consentimiento en cualquier momento';

  @override
  String get consent_learnMore => 'Obtenga más información sobre las prácticas de privacidad en HERE';

  @override
  String get consent_question => '¿Estaría dispuesto a proporcionar esta información a HERE?';
}

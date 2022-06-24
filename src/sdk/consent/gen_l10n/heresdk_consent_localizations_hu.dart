// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Hungarian (`hu`).
class HereSdkConsentLocalizationsHu extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get consent_noThanks => 'Köszönöm, nem';

  @override
  String get consent_okSure => 'OK, persze';

  @override
  String get consent_title =>
      'Az alkalmazás olyan információkat gyűjthet be a környezetével kapcsolatban, mint a közeli wifi-kapcsolatok vagy a térerő.';

  @override
  String get consent_message =>
      'Engedélyével az adatokat szolgáltatásunk javítására használjuk fel. Az információk alapján nem lehet Önt beazonosítani, mi pedig kizárólag anonim információt tárolunk.';

  @override
  String get consent_mayChangeMind => 'Hozzájárulását bármikor visszavonhatja.';

  @override
  String get consent_learnMore => 'Tudjon meg többet adatvédelmi irányelveinkről.';

  @override
  String get consent_question => 'Szeretné megosztani ezt az információt?';
}

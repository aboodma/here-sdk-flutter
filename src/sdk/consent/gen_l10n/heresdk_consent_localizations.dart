import 'dart:async';

// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'heresdk_consent_localizations_ar.dart';
import 'heresdk_consent_localizations_bg.dart';
import 'heresdk_consent_localizations_cs.dart';
import 'heresdk_consent_localizations_da.dart';
import 'heresdk_consent_localizations_de.dart';
import 'heresdk_consent_localizations_el.dart';
import 'heresdk_consent_localizations_en.dart';
import 'heresdk_consent_localizations_es.dart';
import 'heresdk_consent_localizations_fa.dart';
import 'heresdk_consent_localizations_fi.dart';
import 'heresdk_consent_localizations_fr.dart';
import 'heresdk_consent_localizations_he.dart';
import 'heresdk_consent_localizations_hi.dart';
import 'heresdk_consent_localizations_hr.dart';
import 'heresdk_consent_localizations_hu.dart';
import 'heresdk_consent_localizations_id.dart';
import 'heresdk_consent_localizations_it.dart';
import 'heresdk_consent_localizations_ja.dart';
import 'heresdk_consent_localizations_ko.dart';
import 'heresdk_consent_localizations_nb.dart';
import 'heresdk_consent_localizations_nl.dart';
import 'heresdk_consent_localizations_pl.dart';
import 'heresdk_consent_localizations_pt.dart';
import 'heresdk_consent_localizations_ro.dart';
import 'heresdk_consent_localizations_ru.dart';
import 'heresdk_consent_localizations_sk.dart';
import 'heresdk_consent_localizations_sv.dart';
import 'heresdk_consent_localizations_th.dart';
import 'heresdk_consent_localizations_tr.dart';
import 'heresdk_consent_localizations_uk.dart';
import 'heresdk_consent_localizations_zh.dart';

/// Callers can lookup localized strings with an instance of HereSdkConsentLocalizations returned
/// by `HereSdkConsentLocalizations.of(context)`.
///
/// Applications need to include `HereSdkConsentLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/heresdk_consent_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: HereSdkConsentLocalizations.localizationsDelegates,
///   supportedLocales: HereSdkConsentLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: 0.16.1
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the HereSdkConsentLocalizations.supportedLocales
/// property.
abstract class HereSdkConsentLocalizations {
  HereSdkConsentLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  // ignore: unused_field
  final String localeName;

  static HereSdkConsentLocalizations? of(BuildContext context) {
    return Localizations.of<HereSdkConsentLocalizations>(context, HereSdkConsentLocalizations);
  }

  static const LocalizationsDelegate<HereSdkConsentLocalizations> delegate = _HereSdkConsentLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bg'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('en', 'US'),
    Locale('es'),
    Locale('es', 'US'),
    Locale('fa'),
    Locale('fi'),
    Locale('fr'),
    Locale('fr', 'CA'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('he'),
    Locale('ja'),
    Locale('ko'),
    Locale('nb'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ro'),
    Locale('ru'),
    Locale('sk'),
    Locale('sv'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('zh'),
    Locale('zh', 'HK'),
    Locale('zh', 'TW')
  ];

  // Deny consent button text
  String get consent_noThanks;

  // Grant consent button text
  String get consent_okSure;

  // Title of the consent dialog describing what is collected
  String get consent_title;

  // First message line in consent dialog
  String get consent_message;

  // States that user may change their mind later, shown under message in dialog.
  String get consent_mayChangeMind;

  // Link text for HERE privacy web page
  String get consent_learnMore;

  // Question to user whether, shown above dialog buttons
  String get consent_question;
}

class _HereSdkConsentLocalizationsDelegate extends LocalizationsDelegate<HereSdkConsentLocalizations> {
  const _HereSdkConsentLocalizationsDelegate();

  @override
  Future<HereSdkConsentLocalizations> load(Locale locale) {
    return SynchronousFuture<HereSdkConsentLocalizations>(_lookupHereSdkConsentLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'bg',
        'cs',
        'da',
        'de',
        'el',
        'en',
        'es',
        'fa',
        'fi',
        'fr',
        'hi',
        'hr',
        'hu',
        'id',
        'it',
        'he',
        'ja',
        'ko',
        'nb',
        'nl',
        'pl',
        'pt',
        'ro',
        'ru',
        'sk',
        'sv',
        'th',
        'tr',
        'uk',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_HereSdkConsentLocalizationsDelegate old) => false;
}

HereSdkConsentLocalizations _lookupHereSdkConsentLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'en':
      {
        switch (locale.countryCode) {
          case 'US':
            return HereSdkConsentLocalizationsEnUs();
        }
        break;
      }
    case 'es':
      {
        switch (locale.countryCode) {
          case 'US':
            return HereSdkConsentLocalizationsEsUs();
        }
        break;
      }
    case 'fr':
      {
        switch (locale.countryCode) {
          case 'CA':
            return HereSdkConsentLocalizationsFrCa();
        }
        break;
      }
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return HereSdkConsentLocalizationsPtBr();
        }
        break;
      }
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'HK':
            return HereSdkConsentLocalizationsZhHk();
          case 'TW':
            return HereSdkConsentLocalizationsZhTw();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return HereSdkConsentLocalizationsAr();
    case 'bg':
      return HereSdkConsentLocalizationsBg();
    case 'cs':
      return HereSdkConsentLocalizationsCs();
    case 'da':
      return HereSdkConsentLocalizationsDa();
    case 'de':
      return HereSdkConsentLocalizationsDe();
    case 'el':
      return HereSdkConsentLocalizationsEl();
    case 'en':
      return HereSdkConsentLocalizationsEn();
    case 'es':
      return HereSdkConsentLocalizationsEs();
    case 'fa':
      return HereSdkConsentLocalizationsFa();
    case 'fi':
      return HereSdkConsentLocalizationsFi();
    case 'fr':
      return HereSdkConsentLocalizationsFr();
    case 'hi':
      return HereSdkConsentLocalizationsHi();
    case 'hr':
      return HereSdkConsentLocalizationsHr();
    case 'hu':
      return HereSdkConsentLocalizationsHu();
    case 'id':
      return HereSdkConsentLocalizationsId();
    case 'it':
      return HereSdkConsentLocalizationsIt();
    case 'he':
      return HereSdkConsentLocalizationsHe();
    case 'ja':
      return HereSdkConsentLocalizationsJa();
    case 'ko':
      return HereSdkConsentLocalizationsKo();
    case 'nb':
      return HereSdkConsentLocalizationsNb();
    case 'nl':
      return HereSdkConsentLocalizationsNl();
    case 'pl':
      return HereSdkConsentLocalizationsPl();
    case 'pt':
      return HereSdkConsentLocalizationsPt();
    case 'ro':
      return HereSdkConsentLocalizationsRo();
    case 'ru':
      return HereSdkConsentLocalizationsRu();
    case 'sk':
      return HereSdkConsentLocalizationsSk();
    case 'sv':
      return HereSdkConsentLocalizationsSv();
    case 'th':
      return HereSdkConsentLocalizationsTh();
    case 'tr':
      return HereSdkConsentLocalizationsTr();
    case 'uk':
      return HereSdkConsentLocalizationsUk();
    case 'zh':
      return HereSdkConsentLocalizationsZh();
  }

  return HereSdkConsentLocalizationsEn();
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Modern Greek (`el`).
class HereSdkConsentLocalizationsEl extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get consent_noThanks => 'Όχι, ευχαριστώ';

  @override
  String get consent_okSure => 'Ναι, βεβαίως';

  @override
  String get consent_title =>
      'Αυτή η εφαρμογή ενδέχεται να συλλέγει πληροφορίες σχετικά με το περιβάλλον γύρω σας, όπως είναι τα κοντινά σήματα Wi-Fi και κινητής τηλεφωνίας';

  @override
  String get consent_message =>
      'Με την άδειά σας, αυτές οι πληροφορίες αποστέλλονται στη HERE για να τη βοηθήσουν να βελτιώσει τις υπηρεσίες HERE. Αυτές οι πληροφορίες δεν σας ταυτοποιούν και η HERE θα διατηρεί μόνο ανώνυμες πληροφορίες.';

  @override
  String get consent_mayChangeMind => 'Μπορείτε να αναιρέσετε τη συναίνεσή σας ανά πάσα στιγμή';

  @override
  String get consent_learnMore => 'Μάθετε περισσότερα σχετικά με τις πρακτικές απορρήτου της HERE';

  @override
  String get consent_question => 'Θα θέλατε να παρέχετε αυτές τις πληροφορίες στη HERE;';
}

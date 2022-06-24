/*
 * Copyright (c) 2021-2022 HERE Global B.V. and its affiliate(s).
 * All rights reserved.
 *
 * This software and other materials contain proprietary information
 * controlled by HERE and are protected by applicable copyright legislation.
 * Any use and utilization of this software and other materials and
 * disclosure to any third parties is conditional upon having a separate
 * agreement with HERE for the access, use, utilization or disclosure of this
 * software. In the absence of such agreement, the use of the software is not
 * allowed.
 */

import 'package:url_launcher/url_launcher.dart';
import 'language.dart';

class UrlUtils {
  static const _privacyServer = "https://legal.here.com/";
  static const _privacyResource = "/privacy/here-sdk-privacy-supplement";

  static void openPrivacySupplement(String languageCode, String? countryCode) async {
    var urlCode = LanguageUtils.urlLanguageCode(languageCode, countryCode);
    var url = Uri.parse('$_privacyServer$urlCode$_privacyResource');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}

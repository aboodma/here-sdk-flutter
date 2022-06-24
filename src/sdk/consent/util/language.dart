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

class LanguageUtils {
  static const _languageMap = {
    "ar": "eg-ar",
    "bg": "bg-bg",
    "hr": "hr-hr",
    "cs": "cz-cs",
    "da": "dk-da",
    "nl": "nl-nl",
    "et": "ee-et",
    "fi": "fi-fi",
    "de": "de-de",
    "el": "gr-el",
    "iw": "il-he", // Hebrew (iw, not he on Android)
    "hi": "in-hi",
    "hu": "hu-hu",
    "id": "id-id",
    "it": "it-it",
    "ja": "jp-ja",
    "kk": "kz-ru",
    "ko": "kr-ko",
    "lv": "lv-lv",
    "lt": "lt-lt",
    "nb": "nb-no",
    "pl": "pl-pl",
    "ro": "ro-ro",
    "ru": "ru-ru",
    "sr": "rs-sr",
    "sk": "sk-sk",
    "sl": "si-sl",
    "sv": "se-sv",
    "th": "th-th",
    "tr": "tr-tr",
    "uk": "ua-uk",
    "vi": "vn-vi",
    "zh-HK": "hk-zh",
    "zh-CN": "cn-zh",
    "zh-TW": "tw-zh",
    "en-GB": "en-gb",
    "en-US": "us-en",
    "fr-CA": "ca-fr",
    "fr-FR": "fr-fr",
    "pt-BR": "br-pt",
    "pt-PT": "pt-pt",
    "es-MX": "mx-es",
    "es-ES": "es-es",
  };

  static const _languageFallbackMap = {
    "zh": "cn-zh",
    "en": "en-gb",
    "fr": "fr-fr",
    "pt": "pt-pt",
    "es": "es-es",
  };

  static String urlLanguageCode(String languageCode, String? countryCode) {
    if (_languageMap.containsKey(languageCode)) {
      return _languageMap[languageCode]!;
    }
    if (countryCode != null) {
      var languageCountry = '$languageCode-$countryCode';
      if (_languageMap.containsKey(languageCountry)) {
        return _languageMap[languageCountry]!;
      }
    }
    if (_languageFallbackMap.containsKey(languageCode)) {
      return _languageFallbackMap[languageCode]!;
    }
    return _languageMap["en-GB"]!;
  }
}

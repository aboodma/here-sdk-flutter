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

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:here_sdk/consent.dart';
import 'package:flutter/scheduler.dart';
import 'consent_callback.dart';
import 'gen_l10n/heresdk_consent_localizations_en.dart';
import 'util/url.dart';

// TODO IOTSDK-13568 Remove this when support for Flutter 2.10 is dropped
T? _ambiguate<T>(T? value) => value;

/// Internal ConsentDialog class which provides interface for showing the
/// consent dialog.
class ConsentDialog {
  ///
  /// Shows consent dialog.
  /// [context] Caller's build context instance.
  /// [consentInternal] Consent internal instance.
  /// [callback] Optional callback which will be invoked with user chosen
  /// consent result.
  static void show(BuildContext context, ConsentInternal consentInternal, {ConsentRequestCallback? callback}) =>
      showDialog(
        context: context,
        builder: (_) => _ConsentDialog(consentInternal, callback),
        barrierDismissible: false,
      );
}

// Actual consent dialog implementation.
class _ConsentDialog extends StatelessWidget {
  static const _spacing = 20.0;
  static const _smallFontSize = 15.0;
  static const _mediumFontSize = 16.0;
  static const _largeFontSize = 20.0;
  static const _buttonHeight = 52.0;
  static const _fontFamily = 'firago';

  final ConsentInternal _consentInternal;
  final ConsentRequestCallback? _callback;

  _ConsentDialog(this._consentInternal, this._callback);

  @override
  Widget build(BuildContext context) {
    // Fallback to English if localization delegates are not set or language not supported
    var localizations = HereSdkConsentLocalizations.of(context) ?? HereSdkConsentLocalizationsEn();

    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        backgroundColor: _defaultBgColor(),
        insetPadding: const EdgeInsets.all(_spacing * 0.5),
        content: Container(
          constraints: BoxConstraints(minWidth: 100, maxWidth: 300),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Flexible(
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  _titleText(localizations.consent_title),
                  const SizedBox(height: _spacing),
                  _infoText(localizations.consent_message),
                  const SizedBox(height: _spacing),
                  _infoText(localizations.consent_mayChangeMind),
                ]),
              ),
            ),
            const SizedBox(height: _spacing),
            Column(children: <Widget>[
              _learnMoreText(context, localizations.consent_learnMore),
              const SizedBox(height: _spacing * 3),
              _queryText(localizations.consent_question),
              const SizedBox(height: _spacing * 0.5),
              _createGradientButton(
                context,
                localizations.consent_okSure,
                () => _onGrantConsent(context),
              ),
              const SizedBox(height: _spacing * 0.5),
              _createButton(
                context,
                localizations.consent_noThanks,
                () => _onDenyConsent(context),
              ),
            ]),
          ]),
        ),
      ),
    );
  }

  Widget _createGradientButton(BuildContext context, String text, VoidCallback? action) => SizedBox(
        height: _buttonHeight,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: action,
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(_buttonHeight / 2)),
              ),
              padding: EdgeInsets.zero),
          child: Ink(
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                const Color.fromARGB(255, 0x80, 0xaa, 0xff),
                const Color.fromARGB(255, 0x7d, 0xe6, 0xe1),
              ]),
              borderRadius: BorderRadius.all(Radius.circular(_buttonHeight / 2)),
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: _fontFamily,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: _mediumFontSize,
                ),
              ),
            ),
          ),
        ),
      );

  Widget _createButton(BuildContext context, String text, VoidCallback? action) => SizedBox(
        height: _buttonHeight,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: action,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: _denyButtonColor(),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: _denyButtonBorderColor(),
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(_buttonHeight / 2)),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: _fontFamily,
              fontWeight: FontWeight.bold,
              color: _denyButtonTextColor(),
              fontSize: _mediumFontSize,
            ),
          ),
        ),
      );

  Color _denyButtonColor() => isInLightMode ? Colors.white : Colors.black;

  Color _denyButtonTextColor() => isInLightMode ? Colors.black : Colors.white;

  Color _denyButtonBorderColor() => isInLightMode ? Colors.black12 : Colors.white54;

  Text _createText(String text, double size, Color color, {FontWeight weight = FontWeight.normal}) => Text(
        text,
        style: TextStyle(
          fontFamily: _fontFamily,
          color: color,
          fontSize: size,
          fontWeight: weight,
        ),
        softWrap: true,
        textAlign: TextAlign.center,
      );

  Text _titleText(String text) => _createText(
        text,
        _largeFontSize,
        _defaultTextColor(),
        weight: FontWeight.w500,
      );

  Text _infoText(String text) => _createText(
        text,
        _mediumFontSize,
        _defaultTextColor(),
      );

  RichText _learnMoreText(BuildContext context, String text) => RichText(
        text: TextSpan(
            style: TextStyle(
              fontFamily: _fontFamily,
              fontWeight: FontWeight.w300,
              color: Color.fromARGB(255, 0x28, 0x7e, 0xf7),
              fontSize: _smallFontSize,
            ),
            text: text,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                var locale = Localizations.localeOf(context);
                _openPrivacySupplementPage(locale.languageCode, locale.countryCode);
              }),
      );

  Color _defaultTextColor() => isInLightMode ? Colors.black : Colors.white;

  Color _defaultBgColor() => isInLightMode ? Colors.white : Colors.black;

  Text _queryText(String text) => _createText(
        text,
        _mediumFontSize,
        _defaultTextColor(),
        weight: FontWeight.w500,
      );

  void _dismissDialog(BuildContext context) => Navigator.of(context).pop();

  void _onSetConsentState(BuildContext context, ConsentState consentState) {
    _consentInternal.consentState = consentState;
    _callback?.call(consentState);
    _dismissDialog(context);
  }

  void _onGrantConsent(BuildContext context) => _onSetConsentState(context, ConsentState.granted);

  void _onDenyConsent(BuildContext context) => _onSetConsentState(context, ConsentState.notGranted);

  void _openPrivacySupplementPage(String languageCode, String? countryCode) =>
      UrlUtils.openPrivacySupplement(languageCode, countryCode);

  static bool get isInLightMode => _ambiguate(SchedulerBinding.instance)?.window.platformBrightness == Brightness.light;
}

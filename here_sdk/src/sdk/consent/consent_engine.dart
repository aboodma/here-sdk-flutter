/*
 * Copyright (c) 2020-2022 HERE Global B.V. and its affiliate(s).
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

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:here_sdk/consent.dart';
import 'package:here_sdk/src/sdk/consent/consent_f_f_i.dart';
import 'consent_dialog.dart';

/// Consent interface implementation for handling the user consent in different data collection scenarios.
class ConsentEngine implements Consent {
  /// Constructor of the ConsentEngine.
  static final ConsentInternal _consent = ConsentFFI.internalcreateConsentEngine()!;

  /// Shows a localized consent dialog to join the HERE improvement program to contribute data.
  ///
  /// Ask user contribution consent using HERE SDK consent dialog. All applications must
  /// use this method to request user consent, unless HERE has certified the application
  /// to handle requesting user consent on its own.
  /// List of the languages supported by the dialog: English, Arabic, Bulgarian (Bulgaria), Czech, Danish (Denmark),
  /// German, Greek (Greece), English (United States), Spanish, Spanish (United States), Persian (Iran)
  /// Finnish, French, French (Canada), Hindi, Croatian (Croatia), Hungarian (Hungary), Indonesian
  /// Italian, Hebrew (Israel), Japanese (Japan), Korean (South Korea), Norwegian Bokmål (Norway), Dutch
  /// Polish, Portuguese, Portuguese (Brazil), Romanian (Romania), Russian, Slovak (Slovakia), Swedish
  /// Thai, Turkish, Ukrainian (Ukraine), Chinese (Simplified Han,China), Chinese (Simplified Han,Hong Kong)
  /// Chinese (Traditional Han,Taiwan).
  /// The dialog will be displayed according to the device's language preferences, or in English, if they are not supported.
  /// Returns Future of [ConsentState] selected by the user.
  /// [context] Caller's build context instance.
  Future<ConsentUserReply> requestUserConsent(BuildContext context) {
    _consent.consentState = ConsentState.requesting;
    Completer<ConsentUserReply> completer = Completer();
    ConsentDialog.show(context, _consent, callback: (ConsentState state) {
      completer.complete(userConsentState);
    });
    return completer.future;
  }

  /// Grant consent for data contribution. Returns [ConsentStatus.ok] if call succeeded, [ConsentStatus.errNotAllowed] if application is not certified,
  /// or [ConsentStatus.pending] if application's certification  status is not yet known.
  ConsentStatus grantUserConsent() => _consent.grantUserConsent();

  /// Deny consent for data contribution. Returns [ConsentStatus.ok] if call succeeded, [ConsentStatus.errNotAllowed]  if application is not certified,
  /// or [ConsentStatus.pending] if application's certification status is not yet known.
  ConsentStatus denyUserConsent() => _consent.denyUserConsent();

  /// The current user consent state, as a [ConsentUserReply].
  ConsentUserReply get userConsentState {
    switch (_consent.consentState) {
      case ConsentState.granted:
      case ConsentState.pendingGranted:
        return ConsentUserReply.granted;

      case ConsentState.notGranted:
      case ConsentState.pendingNotGranted:
        return ConsentUserReply.denied;

      case ConsentState.requesting:
        return ConsentUserReply.requesting;

      case ConsentState.unknown:
        // This means that consent has not been handled.
        break;
    }

    return ConsentUserReply.notHandled;
  }
}

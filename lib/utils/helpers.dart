import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

extension AppLocalizationFromContext on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}

extension DateTimeExtension on DateTime {
  String representation(BuildContext context) {
    return DateFormat.yMMMd(Platform.localeName).format(this);
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationFromContext on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:topratedmovies/di/components/service_locator.dart';
import 'package:topratedmovies/ui/app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setPreferredOrientations();
  await setupLocator();
  runApp(App());
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
}

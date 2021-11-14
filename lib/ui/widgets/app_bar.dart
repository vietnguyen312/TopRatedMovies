import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar defaultAppBar({
  required BuildContext context,
  required String title,
}) {
  return AppBar(
    title: Center(
        child: Text(
      title,
      style: Theme.of(context).appBarTheme.titleTextStyle,
    )),
  );
}

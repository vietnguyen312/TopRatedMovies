import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar defaultAppBar({
  required BuildContext context,
  required String title,
  List<Widget>? actions,
}) {
  return AppBar(
      title: Center(
        child: Text(
          title,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      actions: actions);
}

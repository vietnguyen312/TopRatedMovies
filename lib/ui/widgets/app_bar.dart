import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar defaultAppBar({
  required BuildContext context,
  required String title,
  List<Widget>? actions,
}) {
  return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      actions: actions);
}

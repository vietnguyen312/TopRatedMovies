import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:topratedmovies/gen/assets.gen.dart';
import 'package:topratedmovies/utils/helpers.dart';

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

Image networkImage(BuildContext context, String url, {WidgetBuilder? loadingBuilder}) {
  return Image.network(
    url,
    fit: BoxFit.contain,
    errorBuilder: (_, __, ___) => const NoImagePlaceHolder(),
    loadingBuilder: (_, child, loadingProgress) {
      if (loadingProgress == null) return child;
      if (loadingBuilder == null) return Container();
      return Builder(
        builder: loadingBuilder,
      );
    },
  );
}

class NoImagePlaceHolder extends StatelessWidget {
  const NoImagePlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.imagePlaceHolder.image(fit: BoxFit.contain),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          alignment: Alignment.center,
          child: Text(
            context.localizations.imageNotAvailable,
            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

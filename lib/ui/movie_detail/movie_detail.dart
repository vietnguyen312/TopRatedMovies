import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:topratedmovies/stores/movie_detail_store.dart';
import 'package:topratedmovies/ui/widgets/app_bar.dart';
import 'package:topratedmovies/utils/helpers.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {

  late MovieDetailStore _movieDetailStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _movieDetailStore = Provider.of<MovieDetailStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: context.localizations.appName,
      ),
      body: Container(),
    );
  }
}

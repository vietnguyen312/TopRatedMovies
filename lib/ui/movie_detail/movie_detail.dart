import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:topratedmovies/constants/dimens.dart';
import 'package:topratedmovies/data/constants/endpoints.dart';
import 'package:topratedmovies/gen/assets.gen.dart';
import 'package:topratedmovies/stores/movie_detail_store.dart';
import 'package:topratedmovies/ui/widgets/shared_widgets.dart';
import 'package:topratedmovies/utils/helpers.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  static const youtubeVideoAspectRatio = 16/9;
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
      body: Column(
        children: [
          Observer(builder: (_) {
            final isLoading = _movieDetailStore.isLoading;
            if (isLoading) {
              return _youtubeLoading();
            } else {
              return Container();
            }
          }),
          Observer(builder: (_) {
            final poster = _movieDetailStore.poster;
            if (poster != null) {
              return _poster(poster);
            } else {
              return Container();
            }
          }),
          Observer(builder: (_) {
            final youtubeId = _movieDetailStore.youtubeTrailerId;
            if (youtubeId != null) {
              return _youtubePlayer(youtubeId);
            } else {
              return Container();
            }
          }),
          const SizedBox(height: Dimens.verticalPadding),
          _movieInformation(),
        ],
      ),
    );
  }

  Widget _movieInformation() {
    return Observer(
      builder: (_) {
        final movie = _movieDetailStore.movie;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.horizontalPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title ?? '', style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: Dimens.verticalPadding),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        movie.releaseDate?.representation(context) ?? '',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Assets.images.star.image(width: 16, height: 16, fit: BoxFit.cover),
                    const SizedBox(width: 4),
                    Text(
                      context.localizations.votedAndCount(
                        movie.voteAverage?.toString() ?? '0',
                        NumberFormat.compact().format(movie.voteCount ?? 0),
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                const SizedBox(height: Dimens.verticalPadding),
                Text(movie.overview ?? '', style: Theme.of(context).textTheme.bodyText2)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _youtubePlayer(String youtubeVideoId) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: youtubeVideoId,
      params: const YoutubePlayerParams(
        autoPlay: false,
        mute: false,

      ),
    );

    return YoutubePlayerIFrame(
      controller: _controller,
    );
  }

  Widget _youtubeLoading() {
    return const AspectRatio(
      aspectRatio: youtubeVideoAspectRatio,
      child: Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _poster(String posterPath) {
    return AspectRatio(
      aspectRatio: youtubeVideoAspectRatio,
      child: Center(
        child: networkImage(
          context,
          Endpoints.moviePoster(posterPath),
          loadingBuilder: (_) => Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

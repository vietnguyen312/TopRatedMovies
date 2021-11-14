import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:topratedmovies/constants/colors.dart';
import 'package:topratedmovies/constants/dimens.dart';
import 'package:topratedmovies/data/constants/endpoints.dart';
import 'package:topratedmovies/gen/assets.gen.dart';
import 'package:topratedmovies/models/movie.dart';
import 'package:topratedmovies/stores/top_rated_movies_store.dart';
import 'package:topratedmovies/ui/widgets/app_bar.dart';
import 'package:topratedmovies/utils/helpers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  static const listViewLoadMoreOffset = 300;
  late TopRatedMoviesStore _ratedMoviesStore;
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_controller.position.extentAfter < listViewLoadMoreOffset) {
      _ratedMoviesStore.loadMore();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _ratedMoviesStore = Provider.of<TopRatedMoviesStore>(context);
    _ratedMoviesStore.fetchInitData();
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: context.localizations.appName,
        actions: [
          IconButton(
            icon: Assets.images.filter.image(),
            onPressed: _onFilterClicked,
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          return _ratedMoviesStore.isInitialLoading
              ? const Center(child: CircularProgressIndicator())
              : _topRatedMoviesListView();
        },
      ),
    );
  }

  Future _onFilterClicked() async {
    final yearRange = await showDialog(
      context: context,
      builder: (context) {
        return _YearRangeFilterDialog();
      },
    );
    if (yearRange is _YearRange) {
      _ratedMoviesStore.filterReleasedDateChanged(yearRange.fromYear, yearRange.toYear);
    }
  }

  Widget _topRatedMoviesListView() {
    return _ratedMoviesStore.filteredTopRatedMovies.isNotEmpty
        ? ListView.builder(
            controller: _controller,
            itemCount: _ratedMoviesStore.filteredTopRatedMovies.length + (_ratedMoviesStore.isLoadingMore ? 1 : 0),
            itemBuilder: (_, index) {
              if (index < _ratedMoviesStore.filteredTopRatedMovies.length) {
                return _MovieItem(_ratedMoviesStore.filteredTopRatedMovies[index]);
              } else {
                return _LoadingMoreItem();
              }
            },
          )
        : Center(child: Text(context.localizations.noContent));
  }
}

class _CardItemWrapper extends StatelessWidget {
  final Widget? child;

  const _CardItemWrapper({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 90,
      child: PhysicalModel(
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        elevation: 4,
        shadowColor: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(6),
        child: child,
      ),
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie _movie;

  const _MovieItem(this._movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CardItemWrapper(
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 90,
            child: _posterWidget(context),
          ),
          Expanded(child: _movieInformation(context))
        ],
      ),
    );
  }

  Widget _movieInformation(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(_movie.title ?? '', style: Theme.of(context).textTheme.subtitle1),
            ),
          ),
          Row(
            children: [
              Expanded(
                child:
                    Text(_movie.releaseDate?.representation(context) ?? '', style: Theme.of(context).textTheme.caption),
              ),
              Assets.images.star.image(width: 16, height: 16, fit: BoxFit.contain),
              const SizedBox(width: 4),
              Text(_movie.voteAverage?.toString() ?? '0', style: Theme.of(context).textTheme.bodyText2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _posterWidget(BuildContext context) {
    if (_movie.posterPath?.isNotEmpty ?? false) {
      return Image.network(
        Endpoints.moviePoster(_movie.posterPath!),
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => _noPoster(context),
        loadingBuilder: (_, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            alignment: Alignment.center,
            child: const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 1.5),
            ),
          );
        },
      );
    } else {
      return _noPoster(context);
    }
  }

  Widget _noPoster(BuildContext context) {
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

class _LoadingMoreItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _CardItemWrapper(
      child: Container(
        alignment: Alignment.center,
        child: const SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class _YearRangeFilterDialog extends StatefulWidget {
  @override
  State createState() => _YearRangeFilterDialogState();
}

class _YearRangeFilterDialogState extends State<_YearRangeFilterDialog> {
  final TextEditingController _fromYearTextController = TextEditingController();
  final TextEditingController _toYearTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.localizations.yearFilterTitle),
      content: Container(
        padding: const EdgeInsets.only(top: Dimens.verticalPadding),
        child: Row(
          children: [
            Expanded(
              child: _yearInput(context.localizations.fromYear, _fromYearTextController),
            ),
            const SizedBox(width: Dimens.horizontalPadding / 2),
            const Text('-'),
            const SizedBox(width: Dimens.horizontalPadding / 2),
            Expanded(child: _yearInput(context.localizations.toYear, _toYearTextController))
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, null),
          child: Text(context.localizations.cancel, textAlign: TextAlign.end),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(
              context,
              _YearRange(
                fromYear: int.tryParse(_fromYearTextController.text),
                toYear: int.tryParse(_toYearTextController.text),
              ),
            );
          },
          child: Text(context.localizations.ok, textAlign: TextAlign.end),
        ),
      ],
    );
  }

  Widget _yearInput(String label, TextEditingController controller) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        counterText: '',
      ),
      maxLength: 4,
      keyboardType: TextInputType.number,
      controller: controller,
    );
  }
}

class _YearRange {
  int? fromYear;
  int? toYear;

  _YearRange({this.fromYear, this.toYear});
}

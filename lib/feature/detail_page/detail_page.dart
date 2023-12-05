import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/model/detail_model/movie_detail_model.dart';
import '../../core/model/movie_model/movie_model.dart';
import '../../utility/widget/center_circler.dart';
import 'cubit/detailpage_cubit.dart';
import 'detail_page_mixin.dart';
import 'widget/body_widget.dart';

///Movie Detail Page.
class DetailPage extends StatefulWidget {
  ///Movie Detail Page constructor.
  const DetailPage({
    required this.items,
    super.key,
  });


  ///Selected movie
  final Search items;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with DetailPageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeviewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.items.title ?? ''),
          actions: [
            BlocSelector<DetailPageCubit, DetailPageState, bool>(
              selector: (state) {
                return state.isFavorites;
              },
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    if (state) {
                      homeviewModel.deleteData(
                        imdbId: widget.items.imdbID ?? '',
                      );
                    } else {
                      homeviewModel.saveData(imdbId: widget.items.imdbID ?? '');
                    }
                  },
                  icon: state
                      ? const Icon(Icons.favorite)
                      : const Icon(
                          Icons.favorite_border,
                        ),
                );
              },
            ),
          ],
        ),
        body: BlocSelector<DetailPageCubit, DetailPageState, bool>(
          selector: (state) => state.isPageLoading,
          builder: (context, state) {
            return state
                ? const CenterCircler()
                : BlocSelector<DetailPageCubit, DetailPageState, MovieDetailModel?>(
                    selector: (state) {
                      return state.detailingMovie;
                    },
                    builder: (context, state) {
                      return BodyWidget(
                        movieDetailModel: state!,
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}

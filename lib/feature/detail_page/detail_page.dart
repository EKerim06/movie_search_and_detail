// ignore_for_file: lines_longer_than_80_chars, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search_and_detail/core/model/detail_model/movie_detail_model.dart';
import 'package:movie_search_and_detail/core/model/movie_model/movie_model.dart';
import 'package:movie_search_and_detail/feature/detail_page/cubit/detailpage_cubit.dart';
import 'package:movie_search_and_detail/feature/detail_page/detail_page_mixin.dart';
import 'package:movie_search_and_detail/feature/detail_page/widget/body_widget.dart';
import 'package:movie_search_and_detail/utility/widget/center_circler.dart';

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
      create: (context) => detailViewModel,
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
                      detailViewModel.deleteData(
                        imdbId: widget.items.imdbID ?? '',
                      );
                    } else {
                      detailViewModel.saveData(
                        imdbId: widget.items.imdbID ?? '',
                      );
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

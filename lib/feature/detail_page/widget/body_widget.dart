import 'package:flutter/material.dart';

import 'package:movie_search_and_detail/core/model/detail_model/movie_detail_model.dart';

///Body widget.
class BodyWidget extends StatelessWidget {
  ///Body widget constructor.
  const BodyWidget({required this.movieDetailModel, super.key});

  ///selected movie detail.
  final MovieDetailModel movieDetailModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.network(
          movieDetailModel.poster!,
          fit: BoxFit.cover,
        ),
        ListTile(
          title: Text(movieDetailModel.title ?? ''),
          subtitle: Text(movieDetailModel.plot!),
        ),
        ListTile(
          title: Text(movieDetailModel.director!),
          subtitle: Text(movieDetailModel.writer!),
        ),
        ListTile(
          title: Text(movieDetailModel.actors!),
          subtitle: Text(movieDetailModel.genre!),
        ),
        ListTile(
          title: Text(movieDetailModel.language!),
          subtitle: Text(movieDetailModel.country!),
        ),
        ListTile(
          title: Text(movieDetailModel.awards!),
          subtitle: Text(movieDetailModel.released!),
        ),
        ListTile(
          title: Text(movieDetailModel.imdbRating!),
          subtitle: Text(movieDetailModel.imdbVotes!),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:movie_search_and_detail/core/model/detail_model/movie_detail_model.dart';
import 'package:movie_search_and_detail/core/model/purshare_model/purshare_model.dart';
import 'package:url_launcher/url_launcher.dart';

///Body widget.
class BodyWidget extends StatelessWidget {
  ///Body widget constructor.
  const BodyWidget({
    required this.movieDetailModel,
    required this.purshareModel,
    super.key,
  });

  ///selected movie detail.
  final MovieDetailModel movieDetailModel;

  ///is fetching movie purshare data.
  final PurshareModel purshareModel;
//purshareModel.results?[0].locations?[0].url;
  ///

  Future<void> _launchUrl({required Uri url}) async {
    if (await launchUrl(url)) {
      await launchUrl(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
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
          title: const Text('IMDB Rating'),
          subtitle: Text(movieDetailModel.imdbRating!),
        ),
        ListTile(
          title: const Text('IMDB Votes'),
          subtitle: Text(movieDetailModel.imdbVotes!),
        ),
        // ListTile(
        //   title: Text(
        //     purshareModel.results?[0].locations?[0].url ?? 'N/a',
        //     style: const TextStyle(
        //       overflow: TextOverflow.ellipsis,
        //     ),
        //   ),
        //   subtitle: Text(
        //     purshareModel.results?[0].locations?[0].displayName ?? 'N/a',
        //   ),
        // ),
        ListView.builder(
          shrinkWrap: true,
          padding: context.padding.low,
          itemCount: purshareModel.results?[0].locations?.length ?? 0,
          itemBuilder: (context, index) {
            final item = purshareModel.results?[0].locations;
            return ElevatedButton(
              onPressed: () {
                final uri = Uri.parse(
                  item?[index].url ?? '',
                );
                _launchUrl(url: uri);
              },
              child: Image.network(item?[index].icon ?? ''),
            );
          },
        ),
      ],
    );
  }
}

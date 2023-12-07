// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search_and_detail/feature/detail_page/detail_page.dart';
import 'package:movie_search_and_detail/feature/favorites_page/cubit/favori_page_cubit.dart';
import 'package:movie_search_and_detail/feature/favorites_page/favorite_page_mixin.dart';
import 'package:movie_search_and_detail/utility/widget/custom_container.dart';

///FavoritePage Widget
class FavoritePage extends StatefulWidget {
  ///FavoritePage constructor
  const FavoritePage({super.key});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> with FavoritePageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => favoriPageViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Favorites'),
        ),
        body: BlocConsumer<FavoriPageCubit, FavoriPageState>(
          listener: (context, state) {},
          builder: (context, state) {
            return (state.savesItems?.isEmpty ?? true)
                ? const Center(
                    child: Text('Herhangi Bir veri henüz yok.'),
                  )
                : ListView.builder(
                    itemCount: state.savesItems?.length ?? 0,
                    itemBuilder: (context, index) {
                      final item = state.savesItems?[index];
                      return Card(
                        child: CustomContainer(
                          items: item!,
                          // title: item?.title,
                          // imageUrl: item?.poster,
                          // buttonIcon: Icons.arrow_forward,
                          // description: item?.type,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => DetailPage(items: item),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}

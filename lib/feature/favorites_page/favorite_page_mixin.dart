import 'package:flutter/material.dart';
import 'package:movie_search_and_detail/core/service/hive/hive_manager.dart';
import 'package:movie_search_and_detail/core/service/hive/hive_service.dart';
import 'package:movie_search_and_detail/feature/favorites_page/cubit/favori_page_cubit.dart';
import 'package:movie_search_and_detail/feature/favorites_page/favorite_page.dart';

///
mixin FavoritePageMixin on State<FavoritePage> {
  ///
  late final FavoriPageCubit favoriPageViewModel;

  ///
  late final HiveManager hiveManager;

  @override
  void initState() {
    hiveManager = HiveService();
    favoriPageViewModel = FavoriPageCubit(hiveManager);
    super.initState();
  }
}

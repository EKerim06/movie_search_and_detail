// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:movie_search_and_detail/core/service/hive/hive_manager.dart';
import 'package:movie_search_and_detail/core/service/hive/hive_service.dart';
import 'package:movie_search_and_detail/core/service/network/network_service.dart';
import 'package:movie_search_and_detail/core/service/network/product_network.dart';
import 'package:movie_search_and_detail/core/service/network/service_interface.dart';
import 'package:movie_search_and_detail/feature/detail_page/cubit/detailpage_cubit.dart';
import 'package:movie_search_and_detail/feature/detail_page/detail_page.dart';

/// Deatail page mixin.
mixin DetailPageMixin on State<DetailPage> {
  ///Detail page cubit initialization.

  late final DetailPageCubit detailViewModel;

  ///Network service initialization.
  late ServiceInterface networkService;

  late HiveManager service;

  @override
  void initState() {
    service = HiveService();
    networkService = NetworkService(ProductNetwork());
    detailViewModel = DetailPageCubit(
      selectedMovie: widget.items,
      networkService,
      hiveService: service,
      imdbId: widget.items.imdbID ?? 'tt0455275',
    );
    super.initState();
  }
}

// mixin DetailPageMixin on State<DetailPage> {
//   late final DetailPageCubit homeviewModel;
//   late ServiceInterface networkSerice;
//   late LocalStorageManager localStorageManager;

//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }

//   Future<void> _init() async {
    // final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();//
//     localStorageManager = LocalStorageService(
//       sharedPreferences: sharedPreferences,
//     );

//     networkSerice = NetworkService(ProductNetwork());
//     homeviewModel = DetailPageCubit(
//       networkSerice,
//       localStorageManager,
//       imdbId: widget.items.imdbID ?? 'tt0455275',
//     );

//     // State'e güncelleme yapmak için setState kullanılabilir.
//     setState(() {});
//   }
// }

import 'package:flutter/material.dart';

import 'package:movie_search_and_detail/core/service/network/network_service.dart';
import 'package:movie_search_and_detail/core/service/network/product_network.dart';
import 'package:movie_search_and_detail/core/service/network/service_interface.dart';
import 'package:movie_search_and_detail/feature/home_page/cubit/home_cubit.dart';
import 'package:movie_search_and_detail/feature/home_page/home_page.dart';

///Home state mixin
mixin HomePageMixin on State<HomePage> {
  ///Network manager
  late final ServiceInterface networkManager;

  ///searchCliked

  ///Home cubit state managment
  late final HomeCubit homeViewModel;


  @override
  void initState() {
    networkManager = NetworkService(ProductNetwork());
    homeViewModel = HomeCubit(networkManager);
    super.initState();
  }
}

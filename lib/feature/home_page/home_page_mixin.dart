import 'package:flutter/material.dart';

import '../../core/service/network/network_service.dart';
import '../../core/service/network/product_network.dart';
import '../../core/service/network/service_interface.dart';
import 'cubit/home_cubit.dart';
import 'home_page.dart';

///Home state mixin
mixin HomePageMixin on State<HomePage> {
  ///Network manager
  late final ServiceInterface networkManager;

  ///searchCliked

  ///Home cubit state managment
  late final HomeCubit homeViewModel;

  @override
  void initState() {
    super.initState();
    networkManager = NetworkService(ProductNetwork());
    homeViewModel = HomeCubit(networkManager);
  }
}

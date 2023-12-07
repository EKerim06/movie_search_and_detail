import 'package:flutter/material.dart';
import 'package:movie_search_and_detail/core/service/hive/hive_manager.dart';
import 'package:movie_search_and_detail/core/service/hive/hive_service.dart';
import 'package:movie_search_and_detail/utility/bottom_bar/bottom_bar.dart';
import 'package:movie_search_and_detail/utility/bottom_bar/cubit/bottombar_cubit.dart';

///BottomBar mixin class
mixin BottomBarMixin on State<BottomBar> {
  ///BottomBar viewModel initialize.
  late final BottombarCubit viewModel;

  ///
  late final HiveManager service;
  
  @override
  void initState() {
    service = HiveService();
    viewModel = BottombarCubit();
    super.initState();
  }
}

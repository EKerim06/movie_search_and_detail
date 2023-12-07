import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search_and_detail/feature/favorites_page/favorite_page.dart';
import 'package:movie_search_and_detail/feature/home_page/home_page.dart';
import 'package:movie_search_and_detail/utility/bottom_bar/bottom_bar_mixin.dart';
import 'package:movie_search_and_detail/utility/bottom_bar/cubit/bottombar_cubit.dart';

///BottomBar widget
class BottomBar extends StatefulWidget {
  ///BottomBar constructor.
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with BottomBarMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: viewModel.state.currentIndex,
          onTap: (value) {
            viewModel.changeCurrentIndex(value);
          },
          elevation: 4,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.explore_sharp),
            ),
            BottomNavigationBarItem(
              label: 'Favorites',
              icon: Icon(Icons.favorite_sharp),
            ),
          ],
        ),
        body: BlocConsumer<BottombarCubit, BottombarState>(
          listener: (context, state) {},
          builder: (context, state) {
            return <Widget>[
              const HomePage(),
              const FavoritePage(),
            ][state.currentIndex];
          },
        ),
      ),
    );
  }
}

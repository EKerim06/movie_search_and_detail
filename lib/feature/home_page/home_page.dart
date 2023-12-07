import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_search_and_detail/feature/detail_page/detail_page.dart';
import 'package:movie_search_and_detail/feature/home_page/cubit/home_cubit.dart';
import 'package:movie_search_and_detail/feature/home_page/home_page_mixin.dart';
import 'package:movie_search_and_detail/utility/widget/custom_container.dart';

///HomePage class for home page
class HomePage extends StatefulWidget {
  ///HomePage constructor
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: Scaffold(
        // bottomNavigationBar: const BottomBar(),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                homeViewModel.changeSearch();
              },
              icon: BlocSelector<HomeCubit, HomeState, bool>(
                selector: (state) {
                  return state.isSearchCliked;
                },
                builder: (context, state) {
                  return Icon(
                    state ? Icons.cancel : Icons.search,
                  );
                },
              ),
            ),
          ],
          title: BlocSelector<HomeCubit, HomeState, bool>(
            selector: (state) {
              return state.isSearchCliked;
            },
            builder: (context, state) {
              return state
                  ? TextField(
                      autofocus: true,
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          homeViewModel
                            ..fetchMovie(movieName: value)
                            ..changeSearch();
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: 'Search',
                      ),
                    )
                  : const Text('Movie Search App');
            },
          ),
        ),
        body: BlocSelector<HomeCubit, HomeState, bool>(
          selector: (state) {
            return state.pageIsLoading;
          },
          builder: (context, state) {
            return state
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : BlocConsumer<HomeCubit, HomeState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return ListView.builder(
                        itemCount: state.movieModel?.search?.length ?? 0,
                        itemBuilder: (context, index) {
                          final item = state.movieModel?.search?[index];
                          return CustomContainer(
                            items: item!,
                            onPressed: () => context.route.navigateToPage(
                              DetailPage(
                                items: item,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}

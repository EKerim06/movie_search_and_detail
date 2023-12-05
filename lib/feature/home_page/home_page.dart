import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:widget/widget.dart';

import '../../core/model/movie_model/movie_model.dart';
import '../detail_page/detail_page.dart';
import 'cubit/home_cubit.dart';
import 'home_page_mixin.dart';

///HomePage class for home page
class HomePage extends StatefulWidget {
  ///HomePage constructor
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: Scaffold(
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
                        print('============== $value');
                        if (value.isNotEmpty) {
                          homeViewModel
                            ..fetchMovi(movieName: value)
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
                          print(item?.imdbID);
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

///MyContainer Customization and veriable.
class CustomContainer extends StatelessWidget {
  ///MyContainer constructor
  const CustomContainer({
    required this.items,
    required this.onPressed,
    super.key,
  });

  ///OnPress methot
  final VoidCallback onPressed;

  /// indexing items
  final Search items;
  @override
  Widget build(BuildContext context) {
    return MyContainer(
      buttonIcon: Icons.arrow_forward_rounded,
      onPressed: onPressed,
      // width: 20,
      imageUrl: items.poster,
      title: items.title,
      description: items.type,
    );
  }
}

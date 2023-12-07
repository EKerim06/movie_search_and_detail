import 'package:flutter/material.dart';
import 'package:movie_search_and_detail/core/model/movie_model/movie_model.dart';
import 'package:widget/widget.dart';

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

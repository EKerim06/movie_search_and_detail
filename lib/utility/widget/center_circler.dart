import 'package:flutter/material.dart';

///Center circler widget.
class CenterCircler extends StatelessWidget {
  ///Center circler widget constructor.
  const CenterCircler({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

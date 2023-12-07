import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_search_and_detail/core/model/movie_model/movie_model.dart';
import 'package:movie_search_and_detail/utility/bottom_bar/bottom_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Hive
    ..initFlutter()
    ..registerAdapter<Search>(SearchAdapter());

  runApp(const MyApp());
}

///My App
class MyApp extends StatelessWidget {
  ///My app constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const BottomBar(),
    );
  }
}

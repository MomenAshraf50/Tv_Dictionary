import 'package:flutter/material.dart';
import 'package:tv_dictionary/core/network/dio_helper.dart';
import 'package:tv_dictionary/core/services/service_locator.dart';
import 'package:tv_dictionary/movies/presentation/screens/movie_details_screen.dart';
import 'package:tv_dictionary/movies/presentation/screens/movie_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tv Dictionary',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900
      ),
      home: const MoviesScreen(),
    );
  }
}



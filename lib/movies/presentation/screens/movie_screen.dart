import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tv_dictionary/core/services/service_locator.dart';
import 'package:tv_dictionary/movies/presentation/components/now_playing_component.dart';
import 'package:tv_dictionary/movies/presentation/components/populre_component.dart';
import 'package:tv_dictionary/movies/presentation/components/top_rated_component.dart';
import 'package:tv_dictionary/movies/presentation/controller/movies_bloc.dart';
import 'package:tv_dictionary/movies/presentation/controller/movies_event.dart';
import 'package:tv_dictionary/movies/presentation/screens/see_more_screen.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              NowPlayingComponent(),
              PopularComponent(),
              TopRatedComponent(),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}

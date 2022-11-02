import 'dart:async';

import 'package:tv_dictionary/core/utils/base_usecase.dart';
import 'package:tv_dictionary/core/utils/enum.dart';
import 'package:tv_dictionary/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:tv_dictionary/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:tv_dictionary/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:tv_dictionary/movies/presentation/controller/movies_event.dart';
import 'package:tv_dictionary/movies/presentation/controller/movies_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  GetPopularMoviesUseCase getPopularMoviesUseCase;

  GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              nowPlayingMessage: l.errorMessage,
              nowPlayingStates: RequestStates.error,
            )),
        (r) => emit(state.copyWith(
              nowPlayingMovies: r,
              nowPlayingStates: RequestStates.loaded,
            )));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              popularMessage: l.errorMessage,
              popularStates: RequestStates.error,
            )),
        (r) => emit(state.copyWith(
              popularMovies: r,
              popularStates: RequestStates.loaded,
            )));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              topRatedMessage: l.errorMessage,
              topRatedStates: RequestStates.error,
            )),
        (r) => emit(state.copyWith(
              topRatedMovies: r,
              topRatedStates: RequestStates.loaded,
            )));
  }
}

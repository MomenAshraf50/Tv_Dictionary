import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_dictionary/core/utils/enum.dart';
import 'package:tv_dictionary/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:tv_dictionary/movies/domain/usecase/get_recommendation_usecase.dart';
import 'package:tv_dictionary/movies/presentation/controller/movie_details_event.dart';
import 'package:tv_dictionary/movies/presentation/controller/movies_details_states.dart';

class MoviesDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailStates> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;

  GetRecommendationUseCase getRecommendationUseCase;

  MoviesDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailStates()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailStates> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(id: event.id));

    result.fold(
        (l) => emit(state.copyWith(
            movieDetailsMessage: l.errorMessage,
            movieDetailsState: RequestStates.error)),
        (r) => emit(state.copyWith(
              movieDetails: r,
              movieDetailsState: RequestStates.loaded,
            )));
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailStates> emit) async {
    final result =
        await getRecommendationUseCase(RecommendationParameters(id: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              recommendationMessage: l.errorMessage,
              recommendationState: RequestStates.error,
            )),
        (r) => emit(state.copyWith(
              recommendation: r,
              recommendationState: RequestStates.loaded,
            )));
  }
}

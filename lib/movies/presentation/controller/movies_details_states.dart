import 'package:equatable/equatable.dart';
import 'package:tv_dictionary/core/utils/enum.dart';
import 'package:tv_dictionary/movies/domain/entities/movie_details.dart';
import 'package:tv_dictionary/movies/domain/entities/recommendation.dart';

class MovieDetailStates extends Equatable {
  final MovieDetails? movieDetails;
  final String movieDetailsMessage;
  final RequestStates movieDetailsState;
  final List<Recommendation> recommendation;
  final String recommendationMessage;
  final RequestStates recommendationState;

  const MovieDetailStates({
    this.movieDetails,
    this.movieDetailsMessage = '',
    this.movieDetailsState = RequestStates.loading,
    this.recommendation = const [],
    this.recommendationMessage = '',
    this.recommendationState = RequestStates.loading,
  });

  MovieDetailStates copyWith({
    MovieDetails? movieDetails,
    String? movieDetailsMessage,
    RequestStates? movieDetailsState,
    List<Recommendation>? recommendation,
    String? recommendationMessage,
    RequestStates? recommendationState,
  }) {
    return MovieDetailStates(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      recommendation: recommendation ?? this.recommendation,
      recommendationMessage: recommendationMessage ?? this.recommendationMessage,
      recommendationState: recommendationState ?? this.recommendationState,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsMessage,
        movieDetailsState,
        recommendation,
        recommendationMessage,
        recommendationState
      ];
}

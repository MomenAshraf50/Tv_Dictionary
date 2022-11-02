import 'package:equatable/equatable.dart';
import 'package:tv_dictionary/core/utils/enum.dart';
import '../../domain/entities/movie.dart';

class MoviesStates extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestStates nowPlayingStates;
  final String nowPlayingMessage;
  final List<Movie> popularMovies;
  final RequestStates popularStates;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final RequestStates topRatedStates;
  final String topRatedMessage;

  const MoviesStates({
    this.nowPlayingMovies = const [],
    this.nowPlayingStates = RequestStates.loading,
    this.nowPlayingMessage = '',
    this.popularMovies = const [],
    this.popularStates = RequestStates.loading,
    this.popularMessage = '',
    this.topRatedMovies = const [],
    this.topRatedStates = RequestStates.loading,
    this.topRatedMessage = '',
  });

  MoviesStates copyWith({
    List<Movie>? nowPlayingMovies,
    RequestStates? nowPlayingStates,
    String? nowPlayingMessage,
    List<Movie>? popularMovies,
    RequestStates? popularStates,
    String? popularMessage,
    List<Movie>? topRatedMovies,
    RequestStates? topRatedStates,
    String? topRatedMessage,
  }) {
    return MoviesStates(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingStates: nowPlayingStates ?? this.nowPlayingStates,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularStates: popularStates ?? this.popularStates,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedStates: topRatedStates ?? this.topRatedStates,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingStates,
        nowPlayingMessage,
        popularMessage,
        popularMovies,
        popularStates,
        topRatedMessage,
        topRatedMovies,
        topRatedStates,
      ];
}

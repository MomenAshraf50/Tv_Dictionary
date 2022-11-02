import 'package:equatable/equatable.dart';
import 'package:tv_dictionary/movies/domain/entities/genres.dart';

class MovieDetails extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final int runtime;
  final double voteAverage;
  final String? backdropPath;
  final List<Genres> genres;

  const MovieDetails(
      {required this.id,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.runtime,
      required this.voteAverage,
      required this.backdropPath,
      required this.genres
      });

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        releaseDate,
        runtime,
        voteAverage,
        backdropPath,
        genres,
      ];

}

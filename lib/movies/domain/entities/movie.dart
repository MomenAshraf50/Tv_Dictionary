import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String backdropPath;
  final String title;
  final List<int> genreIds;
  final int id;
  final String overview;
  final String releaseDate;
  final double voteAverage;

  const Movie({
    required this.backdropPath,
    required this.title,
    required this.genreIds,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        backdropPath,
        id,
        title,
        genreIds,
        overview,
        voteAverage,
        releaseDate,
      ];
}

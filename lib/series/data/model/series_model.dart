import 'package:tv_dictionary/series/domain/entities/series.dart';

class SeriesModel extends Series {
  const SeriesModel({
    required super.backdropPath,
    required super.title,
    required super.genreIds,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
  });

  factory SeriesModel.fromJson(Map<String, dynamic> json) {
    return SeriesModel(
      backdropPath: json['backdrop_path'],
      title: json['title'],
      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      id: json['id'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }
}

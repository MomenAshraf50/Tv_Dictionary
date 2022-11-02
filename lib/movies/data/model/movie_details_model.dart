import 'package:tv_dictionary/movies/data/model/genres_model.dart';
import 'package:tv_dictionary/movies/domain/entities/genres.dart';
import 'package:tv_dictionary/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.voteAverage,
    required super.backdropPath,
    required super.genres,
  });


  factory MovieDetailsModel.fromJson(Map<String,dynamic> json){
    return MovieDetailsModel(
      id: json['id'],
      title:json['title'] ,
      overview: json['overview'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      voteAverage: json['vote_average'].toDouble(),
      backdropPath: json['backdrop_path'],
      genres: List<Genres>.from(json['genres'].map((e) => GenresModel.fromJson(e))),
    );
  }
}

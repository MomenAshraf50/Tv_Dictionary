import 'package:dartz/dartz.dart';
import 'package:tv_dictionary/core/error/failure.dart';
import 'package:tv_dictionary/movies/domain/entities/movie.dart';
import 'package:tv_dictionary/movies/domain/entities/movie_details.dart';
import 'package:tv_dictionary/movies/domain/entities/recommendation.dart';
import 'package:tv_dictionary/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:tv_dictionary/movies/domain/usecase/get_recommendation_usecase.dart';

abstract class BaseMovieRepository{
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure,List<Movie>>> getTopRatedMovies();
  Future<Either<Failure,List<Movie>>> getPopularMovies();
  Future<Either<Failure,MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Failure,List<Recommendation>>> getRecommendation(RecommendationParameters parameters);
}
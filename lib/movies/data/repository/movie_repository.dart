import 'package:dartz/dartz.dart';
import 'package:tv_dictionary/core/error/exceptions.dart';
import 'package:tv_dictionary/core/error/failure.dart';
import 'package:tv_dictionary/movies/data/data_source/movie_remote_data_source.dart';
import 'package:tv_dictionary/movies/domain/entities/movie.dart';
import 'package:tv_dictionary/movies/domain/entities/movie_details.dart';
import 'package:tv_dictionary/movies/domain/entities/recommendation.dart';
import 'package:tv_dictionary/movies/domain/repository/base_movie_repository.dart';
import 'package:tv_dictionary/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:tv_dictionary/movies/domain/usecase/get_recommendation_usecase.dart';

class MovieRepository extends BaseMovieRepository{

  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;


  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies() async{
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure,List<Movie>>> getPopularMovies() async{
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Movie>>> getTopRatedMovies() async{
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters) async{
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async{
    final result = await baseMovieRemoteDataSource.getRecommendation(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }


}
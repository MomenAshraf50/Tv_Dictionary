import 'package:dartz/dartz.dart';
import 'package:tv_dictionary/core/utils/base_usecase.dart';
import 'package:tv_dictionary/movies/domain/entities/movie.dart';
import 'package:tv_dictionary/movies/domain/repository/base_movie_repository.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMovieRepository repository;

  GetNowPlayingMoviesUseCase(this.repository);

  @override
  Future<Either<Failure,List<Movie>>> call(NoParameters parameters) async{
    return await repository.getNowPlayingMovies();
  }
}

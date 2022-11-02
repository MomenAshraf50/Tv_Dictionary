import 'package:dartz/dartz.dart';
import 'package:tv_dictionary/core/utils/base_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMovieRepository repository;

  GetPopularMoviesUseCase(this.repository);

  @override
  Future<Either<Failure,List<Movie>>> call(NoParameters parameters) async{
    return await repository.getPopularMovies();
  }
}


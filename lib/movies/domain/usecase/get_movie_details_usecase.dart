import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_dictionary/core/error/failure.dart';
import 'package:tv_dictionary/core/utils/base_usecase.dart';
import 'package:tv_dictionary/movies/domain/entities/movie_details.dart';
import 'package:tv_dictionary/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails,MovieDetailsParameters>{

  final BaseMovieRepository baseMovieRepository;


  GetMovieDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameters) async {
    return await baseMovieRepository.getMovieDetails(parameters);
  }
}
class MovieDetailsParameters extends Equatable{
  final int id;

  const MovieDetailsParameters({required this.id});

  @override
  List<Object?> get props => [id];
}
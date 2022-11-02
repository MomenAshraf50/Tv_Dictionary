import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_dictionary/core/error/failure.dart';
import 'package:tv_dictionary/core/utils/base_usecase.dart';
import 'package:tv_dictionary/movies/domain/entities/recommendation.dart';
import 'package:tv_dictionary/movies/domain/repository/base_movie_repository.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation>,RecommendationParameters>{

  BaseMovieRepository baseMovieRepository;

  GetRecommendationUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters)async {

    return await baseMovieRepository.getRecommendation(parameters);
  }
}



class RecommendationParameters extends Equatable{
  final int id;

  const RecommendationParameters({required this.id});

  @override
  List<Object?> get props => [id];
}
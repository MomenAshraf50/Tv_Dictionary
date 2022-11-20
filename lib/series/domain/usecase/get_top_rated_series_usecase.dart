import 'package:dartz/dartz.dart';
import 'package:tv_dictionary/core/error/failure.dart';
import 'package:tv_dictionary/core/utils/base_usecase.dart';
import 'package:tv_dictionary/series/domain/entities/series.dart';
import 'package:tv_dictionary/series/domain/repository/base_series_repository.dart';

class GetTopRatedUseCase extends BaseUseCase<List<Series>,NoParameters>{
  BaseSeriesRepository baseSeriesRepository;


  GetTopRatedUseCase(this.baseSeriesRepository);

  @override
  Future<Either<Failure, List<Series>>> call(NoParameters parameters) {
    return baseSeriesRepository.getTopRatedSeries();
  }
}
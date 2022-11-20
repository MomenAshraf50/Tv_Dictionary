import 'package:dartz/dartz.dart';
import 'package:tv_dictionary/core/error/exceptions.dart';
import 'package:tv_dictionary/core/error/failure.dart';
import 'package:tv_dictionary/series/data/data_source/series_remote_data_source.dart';
import 'package:tv_dictionary/series/domain/entities/series.dart';
import 'package:tv_dictionary/series/domain/repository/base_series_repository.dart';

class SeriesRepository extends BaseSeriesRepository{

  BaseSeriesRemoteDataSource baseSeriesRemoteDataSource;


  SeriesRepository(this.baseSeriesRemoteDataSource);

  @override
  Future<Either<Failure, List<Series>>> getOnAirSeries() async{
    final result = await baseSeriesRemoteDataSource.getOnAirSeries();

    try
    {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getPopularSeries() async{
    final result = await baseSeriesRemoteDataSource.getPopularSeries();

    try
    {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getTopRatedSeries() async{
    final result = await baseSeriesRemoteDataSource.getTopRatedSeries();

    try
    {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
import 'package:dartz/dartz.dart';
import 'package:tv_dictionary/core/error/failure.dart';
import 'package:tv_dictionary/series/domain/entities/series.dart';

abstract class BaseSeriesRepository{

  Future<Either<Failure,List<Series>>> getOnAirSeries();
  Future<Either<Failure,List<Series>>> getPopularSeries();
  Future<Either<Failure,List<Series>>> getTopRatedSeries();

}
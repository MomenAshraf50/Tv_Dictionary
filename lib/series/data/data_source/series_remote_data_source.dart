import 'package:tv_dictionary/core/error/exceptions.dart';
import 'package:tv_dictionary/core/network/dio_helper.dart';
import 'package:tv_dictionary/core/network/error_message_model.dart';
import 'package:tv_dictionary/core/utils/app_constants.dart';
import 'package:tv_dictionary/series/data/model/series_model.dart';

abstract class BaseSeriesRemoteDataSource{
  Future<List<SeriesModel>> getOnAirSeries();
  Future<List<SeriesModel>> getPopularSeries();
  Future<List<SeriesModel>> getTopRatedSeries();
}

class SeriesRemoteDataSource extends BaseSeriesRemoteDataSource {
  @override
  Future<List<SeriesModel>> getOnAirSeries() async{
    final response = await DioHelper.getData(endPoints: AppConstants.onAirEndPoint);

    if (response.statusCode == 200){
      return List<SeriesModel>.from((response.data['results'] as List).map((e)=> SeriesModel.fromJson(e)));
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<SeriesModel>> getPopularSeries() async{
    final response = await DioHelper.getData(endPoints: AppConstants.popularSeriesEndPoint);

    if(response.statusCode == 200){
      return List<SeriesModel>.from((response.data['results'] as List).map((e) => SeriesModel.fromJson(e)));
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<SeriesModel>> getTopRatedSeries() async{
    final response = await DioHelper.getData(endPoints: AppConstants.topRatedSeriesEndPoint);

    if(response.statusCode == 200){
      return List<SeriesModel>.from((response.data['results'] as List ).map((e) => SeriesModel.fromJson(e)));

    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }
}
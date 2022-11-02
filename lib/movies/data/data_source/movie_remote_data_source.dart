import 'package:tv_dictionary/core/error/exceptions.dart';
import 'package:tv_dictionary/core/network/dio_helper.dart';
import 'package:tv_dictionary/core/network/error_message_model.dart';
import 'package:tv_dictionary/core/utils/app_constants.dart';
import 'package:tv_dictionary/movies/data/model/movie_details_model.dart';
import 'package:tv_dictionary/movies/data/model/movie_model.dart';
import 'package:tv_dictionary/movies/data/model/recommendation_model.dart';
import 'package:tv_dictionary/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:tv_dictionary/movies/domain/usecase/get_recommendation_usecase.dart';


abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async{
    final response = await DioHelper.getData(endPoints: AppConstants.nowPlayingEndPoint);
    if(response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map((e) =>
          MovieModel.fromJson(e)));
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await DioHelper.getData(endPoints: AppConstants.popularEndPoint);
    if(response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map((e) =>
          MovieModel.fromJson(e)));
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }
  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await DioHelper.getData(endPoints: AppConstants.topRatedEndPoint);
    if(response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map((e) =>
          MovieModel.fromJson(e)));
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters) async{
    final response = await DioHelper.getData(endPoints: AppConstants.getMovieDetailsEndPoint(parameters.id));
    if(response.statusCode == 200){
      return MovieDetailsModel.fromJson(response.data);
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters) async{
    final response = await DioHelper.getData(endPoints: AppConstants.getRecommendationEndPoint(parameters.id));
    print(response);
    if(response.statusCode == 200){
      return List<RecommendationModel>.from((response.data['results'] as List).map((e) =>
          RecommendationModel.fromJson(e)));
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }
}
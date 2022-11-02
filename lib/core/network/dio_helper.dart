import 'package:dio/dio.dart';
import 'package:tv_dictionary/core/utils/app_constants.dart';

class DioHelper{
  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response> getData({required String endPoints})async {
    return await dio.get(endPoints);
  }

}
import 'package:tv_dictionary/core/network/error_message_model.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;

  ServerException(this.errorMessageModel);
}
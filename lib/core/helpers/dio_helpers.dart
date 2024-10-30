import 'package:api_dio/core/const/api_const.dart';
import 'package:dio/dio.dart';

class DioHelpers {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConst.baseUrl,
        headers: {
          'Content-Type':'application/json',
          
        },
      ),
    );
  }
}

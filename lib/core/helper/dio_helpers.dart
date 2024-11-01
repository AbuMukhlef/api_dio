
import 'package:api_dio/core/const/api_const.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConst.baseUrl,
        headers: {
          'Content-Type': 'application/json',
          
        },
      ),
    );
  }

  static Future<Response> getData({
    required String endPoints,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer ${token ?? ''}',
      };

      final response = await dio.get(
        endPoints,
        queryParameters: queryParameters,
      );
      return response;

    } catch (e) {
      rethrow;
    }
  }
}

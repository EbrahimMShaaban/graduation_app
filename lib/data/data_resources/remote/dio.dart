import 'package:dio/dio.dart';
class DioHelper {
  static late Dio dio;

  static init() {

    dio = Dio(BaseOptions(
      baseUrl: 'https://vast-tundra-45756.herokuapp.com/api/',
      receiveDataWhenStatusError: true,
    ));
  }


  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }







  static Future<Response> postData(
      {
        required String url,
      Map<String, dynamic>? query,
      required  Map<String, dynamic>? data,
      String? token

      }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      // 'Authorization': token ?? '50|Jm91i85ujDUJAkpe0hv49B21TiTPkKoucqEb0PZf',
      'Authorization':'Bearer 50|Jm91i85ujDUJAkpe0hv49B21TiTPkKoucqEb0PZf',

    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}

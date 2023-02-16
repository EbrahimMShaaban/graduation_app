import 'package:dio/dio.dart';

import './end_points.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    try {
      dio = Dio(
        BaseOptions(
            receiveDataWhenStatusError: true,
            baseUrl: BASEURL,
            headers: {"Accept": "application/json"}),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<Response> getdata({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.get(url,
        queryParameters: query, options: Options(headers: headers));
  }

  static Future<Response> postdata(
      {required String url, Map<String, dynamic>? posteddata, headers}) async {
    return await dio.post(url,
        data: posteddata, options: Options(headers: headers));
  }

  static Future<Response> putdata(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> posteddata,
      headers}) async {
    return await dio.put(url,
        queryParameters: query,
        data: posteddata,
        options: Options(headers: headers));
  }

  static Future<Response> deletedata({
    required String url,
    headers
  }) async {
    return await dio.delete(
      url,
      options: Options(headers: headers),
    );
  }
}

import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  /// Initialize Dio
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://potterapi-fedeperin.vercel.app/en/", // ضع رابط الـ API هنا
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    /// Interceptors (للتعامل مع الـ Logs و Token وغيره)
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  /// GET
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
      options: Options(
        headers: {
          if (token != null) "Authorization": "Bearer $token",
        },
      ),
    );
  }

  /// POST
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return await dio.post(
      url,
      data: data,
      queryParameters: query,
      options: Options(
        headers: {
          if (token != null) "Authorization": "Bearer $token",
        },
      ),
    );
  }

  /// PUT
  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    return await dio.put(
      url,
      data: data,
      options: Options(
        headers: {
          if (token != null) "Authorization": "Bearer $token",
        },
      ),
    );
  }

  /// DELETE
  static Future<Response> deleteData({
    required String url,
    String? token,
  }) async {
    return await dio.delete(
      url,
      options: Options(
        headers: {
          if (token != null) "Authorization": "Bearer $token",
        },
      ),
    );
  }
}
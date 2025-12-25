import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://dummyjson.com",
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  Future<Map<String, dynamic>> login(
      String username, String password) async {
    try {
      final response = await _dio.post(
        "/auth/login",
        data: {
          "username": username,
          "password": password,
        },
      );

      return {
        "success": true,
        "data": response.data,
      };
    } on DioException catch (e) {
      return {
        "success": false,
        "message": e.response?.data["message"] ?? "Login failed",
      };
    }
  }
}

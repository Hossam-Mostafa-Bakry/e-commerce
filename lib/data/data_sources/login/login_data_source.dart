import 'package:dio/dio.dart';
import '../../../domain/entites/register/register_request_data.dart';

class LoginDataSource {
  final Dio _dio;

  LoginDataSource(this._dio);

  Future<Response> login({
    required String email,
    required String password,
  }) async {
    return await _dio.post(
      "/api/v1/auth/signin",
      data: {
        "email": email,
        "password": password,
      },
    );
  }
}

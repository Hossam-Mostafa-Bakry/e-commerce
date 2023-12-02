import 'package:dio/dio.dart';
import '../../../domain/entites/register/register_request_data.dart';

class RegisterDataSource {

  final Dio _dio;

  RegisterDataSource(this._dio);

  Future<Response> register(RegisterRequestData data) async {
    return await _dio.post(
      "/api/v1/auth/signup",
      data: {
        "name": data.name,
        "email": data.emial,
        "password": data.password,
        "rePassword": data.password,
        "phone": data.phone,
      },
    );
  }
}

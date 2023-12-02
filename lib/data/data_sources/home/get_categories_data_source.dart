import 'package:dio/dio.dart';

class GetCategoriesDataSource {
  final Dio _dio;

  GetCategoriesDataSource(this._dio);

  Future<Response> getCategories() async {
    return await _dio.get(
      "/api/v1/categories",
    );
  }
}

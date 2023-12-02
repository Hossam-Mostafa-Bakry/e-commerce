import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c9_mon/core/error/failures.dart';
import 'package:e_commerce_app_c9_mon/data/data_sources/register/register_data_source.dart';
import 'package:e_commerce_app_c9_mon/domain/repository/register/register_repository.dart';

import '../../../domain/entites/register/register_request_data.dart';
import '../../../domain/repository/login/login_repository.dart';
import '../../data_sources/login/login_data_source.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginDataSource _registerDataSource;

  LoginRepositoryImp(this._registerDataSource);

  @override
  Future<Either<ServerFailure, bool>> login({
    required String email,
    required String password,
  }) async {
    var response = await _registerDataSource.login(
      email: email,
      password: password,
    );

    if (response.statusCode == 200 && response.data["message"] == "success") {
      return const Right(true);
    } else {
      return Left(
        ServerFailure(
          statusCode: response.statusCode.toString(),
          message: response.data["message"],
        ),
      );
    }
  }
}

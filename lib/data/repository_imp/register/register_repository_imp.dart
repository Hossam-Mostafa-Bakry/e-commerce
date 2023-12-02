import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c9_mon/core/error/failures.dart';
import 'package:e_commerce_app_c9_mon/data/data_sources/register/register_data_source.dart';
import 'package:e_commerce_app_c9_mon/domain/repository/register/register_repository.dart';

import '../../../domain/entites/register/register_request_data.dart';

class RegisterRepositoryImp implements RegisterRepository {

  
  final RegisterDataSource _registerDataSource;

  RegisterRepositoryImp(this._registerDataSource);

  @override
  Future<Either<ServerFailure, bool>> register(RegisterRequestData data) async {

    var response = await _registerDataSource.register(data);

    if (response.statusCode == 201 && response.data["message"] == "success") {
      return const Right(true);
    } else if (response.statusCode == 409) {
      return Left(
        ServerFailure(
          statusCode: response.statusCode.toString(),
          message: response.data["message"],
        ),
      );
    } else {
      return Left(
        ServerFailure(
          statusCode: response.statusCode.toString(),
        ),
      );
    }
    
  }
}

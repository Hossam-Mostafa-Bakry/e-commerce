import 'package:dartz/dartz.dart';

import '../../../core/error/server_failure.dart';
import '../../entites/register/register_request_data.dart';

abstract class LoginRepository {

  Future<Either<ServerFailure, bool>> login({
    required String email,
    required String password,
  });
}
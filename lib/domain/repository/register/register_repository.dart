import 'package:dartz/dartz.dart';

import '../../../core/error/server_failure.dart';
import '../../entites/register/register_request_data.dart';

abstract class RegisterRepository {

  Future<Either<ServerFailure, bool>> register(RegisterRequestData data);
}
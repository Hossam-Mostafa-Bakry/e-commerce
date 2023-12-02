import 'package:dartz/dartz.dart';


import '../../../domain/repository/register/register_repository.dart';
import '../../../core/error/server_failure.dart';
import '../../entites/register/register_request_data.dart';

class RegisterUseCse {

  final RegisterRepository _registerRepository;
  RegisterUseCse(this._registerRepository);

  Future<Either<ServerFailure, bool>> excute(RegisterRequestData data) async {
    return await _registerRepository.register(data);

  }


}
import 'package:dartz/dartz.dart';


import '../../../core/error/server_failure.dart';
import '../../entites/register/register_request_data.dart';
import '../../repository/login/login_repository.dart';

class LoginUseCse {

  final LoginRepository _registerRepository;
  LoginUseCse(this._registerRepository);

  Future<Either<ServerFailure, bool>> excute(String email, String password) async {
    return await _registerRepository.login(email: email, password: password);

  }


}
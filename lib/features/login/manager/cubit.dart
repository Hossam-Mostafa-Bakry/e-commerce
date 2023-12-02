import 'package:e_commerce_app_c9_mon/core/serivces/web_service.dart';
import 'package:e_commerce_app_c9_mon/data/data_sources/login/login_data_source.dart';
import 'package:e_commerce_app_c9_mon/data/repository_imp/login/login_repository_imp.dart';
import 'package:e_commerce_app_c9_mon/domain/repository/login/login_repository.dart';
import 'package:e_commerce_app_c9_mon/domain/use_cases/login/login_use_case.dart';
import 'package:e_commerce_app_c9_mon/features/login/manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginIntialState());

  // 1- intial state

  static LoginCubit get(context) => BlocProvider.of(context);

  WebServices _services = WebServices();

  late LoginDataSource _dataSource;
  late LoginRepository _loginRepository;
  late LoginUseCse _loginUseCse;

  Future<bool> login(String email, String password) async {

    emit(LoginLoadingState());
    _dataSource = LoginDataSource(_services.freeDio);
    _loginRepository = LoginRepositoryImp(_dataSource);
    _loginUseCse = LoginUseCse(_loginRepository);

    EasyLoading.show();
    var result = await _loginUseCse.excute(email, password);

    return result.fold(
      (fail) {
        EasyLoading.dismiss();
        emit(LoginErrorState());
        return Future.value(false);
      },
      (data) {
        EasyLoading.dismiss();
        emit(LoginSuccessState());
        return Future.value(true);
      },
    );
  }
}

import 'package:e_commerce_app_c9_mon/core/serivces/web_service.dart';
import 'package:e_commerce_app_c9_mon/data/data_sources/register/register_data_source.dart';
import 'package:e_commerce_app_c9_mon/data/repository_imp/register/register_repository_imp.dart';
import 'package:e_commerce_app_c9_mon/domain/entites/register/register_request_data.dart';
import 'package:e_commerce_app_c9_mon/domain/repository/register/register_repository.dart';
import 'package:e_commerce_app_c9_mon/domain/use_cases/register/register_use_case.dart';
import 'package:e_commerce_app_c9_mon/features/register/manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  WebServices _services = WebServices();

  late RegisterUseCse _registerUseCse;
  late RegisterRepository _registerRepository;
  late RegisterDataSource _registerDataSource;

  Future<bool> register(RegisterRequestData data) async {
    emit(RegisterLoadingState());
    _registerDataSource = RegisterDataSource(_services.freeDio);
    _registerRepository = RegisterRepositoryImp(_registerDataSource);
    _registerUseCse = RegisterUseCse(_registerRepository);

    EasyLoading.show();
    var result = await _registerUseCse.excute(data);

    return result.fold(
      (fail) {
        EasyLoading.dismiss();
        emit(RegisterErrorState());
        return Future.value(false);
      },
      (data) {
        EasyLoading.dismiss();
        emit(RegisterSuccessState());
        return Future.value(true);
      },
    );
  }
}

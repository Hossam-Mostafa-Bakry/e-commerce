import 'package:e_commerce_app_c9_mon/core/error/failures.dart';
import 'package:e_commerce_app_c9_mon/core/serivces/web_service.dart';
import 'package:e_commerce_app_c9_mon/data/data_sources/home/get_categories_data_source.dart';
import 'package:e_commerce_app_c9_mon/data/repository_imp/home/get_categories_repository_imp.dart';
import 'package:e_commerce_app_c9_mon/domain/entites/home/category_entity.dart';
import 'package:e_commerce_app_c9_mon/domain/repository/home/get_categories_repository.dart';
import 'package:e_commerce_app_c9_mon/domain/use_cases/home/get_categories_use_case.dart';
import 'package:e_commerce_app_c9_mon/features/home/manager/states.dart';
import 'package:e_commerce_app_c9_mon/features/home/pages/category_view.dart';
import 'package:e_commerce_app_c9_mon/features/home/pages/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../pages/favorite_view.dart';
import '../pages/profile_view.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeIntialStates());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    HomeView(),
    CategoryView(),
    FavoriteView(),
    ProfileView(),
  ];
  WebServices _services = WebServices();

  late GetCategoriesUseCase _getCategoriesUseCase;
  late GetCategoriesRepository _categoriesRepository;
  late GetCategoriesDataSource _categoriesDataSource;

  int _selectedIndex = 0;
  List<CategoryEntity> _categoriesList = [];


  int get selectedIndex => _selectedIndex;
  List<CategoryEntity> get categoriesList => _categoriesList;

  void changeBottomNavigationBarStatus(int index) {
    _selectedIndex = index;
    emit(ChangeBottomNavigationBarStates());
  }

  Future<void> getCategories() async {

    emit(HomeCategoriesLoadingStates());
    // DI
    _categoriesDataSource = GetCategoriesDataSource(_services.freeDio);
    _categoriesRepository = GetCategoriesRepositoryImp(_categoriesDataSource);
    _getCategoriesUseCase = GetCategoriesUseCase(_categoriesRepository);

    var result = await _getCategoriesUseCase.excute();

    return result.fold(
      (fail) {
        var error = fail as ServerFailure;
        emit(HomeCategoriesErrorStates());
      },
      (data) {
        _categoriesList = data;
        emit(HomeCategoriesSuccessStates());
      },
    );
  }
}

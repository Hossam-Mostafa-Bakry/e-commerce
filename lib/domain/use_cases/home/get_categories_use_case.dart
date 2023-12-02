import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c9_mon/domain/repository/home/get_categories_repository.dart';

import '../../../core/error/failure.dart';
import '../../entites/home/category_entity.dart';

class GetCategoriesUseCase {


  final GetCategoriesRepository _categoriesRepository;
  GetCategoriesUseCase(this._categoriesRepository);

  Future<Either<Failure, List<CategoryEntity>>> excute() async {
    return await _categoriesRepository.getCategories();
  }
}
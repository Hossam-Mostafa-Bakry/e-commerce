import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c9_mon/core/error/failure.dart';

import '../../entites/home/category_entity.dart';

abstract class GetCategoriesRepository {

  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
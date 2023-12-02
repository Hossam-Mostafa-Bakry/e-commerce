import 'package:dartz/dartz.dart';

import 'package:e_commerce_app_c9_mon/core/error/failure.dart';
import 'package:e_commerce_app_c9_mon/core/error/failures.dart';
import 'package:e_commerce_app_c9_mon/data/data_sources/home/get_categories_data_source.dart';
import 'package:e_commerce_app_c9_mon/data/models/home/category_model.dart';

import '../../../domain/entites/home/category_entity.dart';
import '../../../domain/repository/home/get_categories_repository.dart';

class GetCategoriesRepositoryImp extends GetCategoriesRepository {
  final GetCategoriesDataSource _categoriesDataSource;

  GetCategoriesRepositoryImp(this._categoriesDataSource);

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    var response = await _categoriesDataSource.getCategories();

    if (response.statusCode == 200) {
      // we need to parse json response to dart object

      List<CategoryEntity> list = [];
      
      (response.data["data"] as List).forEach(
        (element) {
          list.add(CategoryModel.fromJson(element));
        },
      );

      return Right(list);
    } else {
      return Left(
        ServerFailure(
          statusCode: response.statusCode.toString(),
        ),
      );
    }
  }
}

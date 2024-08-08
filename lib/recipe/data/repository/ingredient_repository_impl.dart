import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/recipe/data/data_source/ingredient/ingredient_data_source.dart';
import 'package:food_recipe_app/recipe/domain/model/ingredient.dart';
import 'package:food_recipe_app/recipe/domain/repository/ingredient_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IngredientRepository)
class IngredientRepositoryImpl implements IngredientRepository {
  final IngredientDataSource datasource;

  const IngredientRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Result<List<Ingredient>>> getIngredient() async {
    try {
      final result = await datasource.getIngredients();
      return Result.success(result);
    } catch (e) {
      return const Result.error('로드에 실패했습니다.');
    }
  }
}

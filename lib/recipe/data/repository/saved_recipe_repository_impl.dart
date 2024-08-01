import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/recipe/data/data_source/recipe/recipe_data_source.dart';
import 'package:food_recipe_app/recipe/domain/model/recipe.dart';
import 'package:food_recipe_app/recipe/domain/repository/saved_recipe_repository.dart';

class SavedRecipeRepositoryImpl implements SavedRecipeRepository {
  final RecipeDataSource _recipeDataSource;

  const SavedRecipeRepositoryImpl({
    required RecipeDataSource recipeDataSource,
  }) : _recipeDataSource = recipeDataSource;

  @override
  Future<Result<List<Recipe>>> getRecipes() async {
    try {
      final result = await _recipeDataSource.getRecipes();
      return Result.success(result);
    } catch (e) {
      return const Result.error('로드에 실패했습니다.');
    }
  }
}

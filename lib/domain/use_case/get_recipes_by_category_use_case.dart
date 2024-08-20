import 'package:food_recipe_app/core/util/result.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';

class GetRecipesByCategoryUseCase {
  final RecipeRepository _recipeRepository;

  GetRecipesByCategoryUseCase(this._recipeRepository);

  Future<Result<List<Recipe>>> execute(String category) async {
    try {
      final results = await _recipeRepository.getRecipes();
      if (category == 'All') {
        return Result.success(results);
      }
      return Result.success(
          results.where((e) => e.category == category).toList());
    } catch (e) {
      return const Result.error('GetRecipesByCategoryUseCase Error');
    }
  }
}

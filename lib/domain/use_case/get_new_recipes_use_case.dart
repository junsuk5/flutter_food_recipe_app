import 'package:food_recipe_app/core/util/result.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';

class GetNewRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetNewRecipesUseCase(this._recipeRepository);

  Future<Result<List<Recipe>>> execute() async {
    try {
      final results = await _recipeRepository.getRecipes();
      return Result.success(results.take(5).toList());
    } catch (e) {
      return const Result.error('GetNewRecipesUseCase Error');
    }
  }
}

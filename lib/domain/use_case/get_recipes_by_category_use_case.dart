import 'package:food_recipe_app/core/util/result.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';

class GetRecipesByCategoryUseCase {
  final RecipeRepository _recipeRepository;

  GetRecipesByCategoryUseCase(this._recipeRepository);

  Future<Result<List<Recipe>>> execute(String category) async {
    final result = await _recipeRepository.getRecipes();

    switch (result) {
      case Success<List<Recipe>>():
        if (category == 'All') {
          return Result.success(result.data);
        }
        return Result.success(
            result.data.where((e) => e.category == category).toList());
      case Error<List<Recipe>>():
        return Result.error(result.message);
    }
  }
}

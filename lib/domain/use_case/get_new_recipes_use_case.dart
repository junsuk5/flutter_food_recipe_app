import 'package:collection/collection.dart';
import 'package:food_recipe_app/core/util/result.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';

class GetNewRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetNewRecipesUseCase(this._recipeRepository);

  Future<Result<List<Recipe>>> execute() async {
    final result = await _recipeRepository.getRecipes();
    switch (result) {
      case Success<List<Recipe>>():
        return Result.success(result.data.take(5).toList());
      case Error<List<Recipe>>():
        return Result.error(result.message);
    }
  }
}

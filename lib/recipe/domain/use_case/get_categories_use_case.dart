import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/recipe/domain/model/recipe.dart';
import 'package:food_recipe_app/recipe/domain/repository/recipe_repository.dart';

class GetCategoriesUseCase {
  final RecipeRepository _recipeRepository;

  GetCategoriesUseCase(this._recipeRepository);

  Future<Result<List<String>>> execute() async {
    final result = await _recipeRepository.getRecipes();

    switch (result) {
      case Success<List<Recipe>>():
        return Result.success([
          'All',
          ...result.data.map((e) => e.category).toSet(),
        ]);
      case Error<List<Recipe>>():
        return Result.error(result.message);
    }
  }
}

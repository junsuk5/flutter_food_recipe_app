import 'package:food_recipe_app/core/util/result.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';

class GetCategoriesUseCase {
  final RecipeRepository _recipeRepository;

  GetCategoriesUseCase(this._recipeRepository);

  Future<Result<List<String>>> execute() async {
    try {
      final results = await _recipeRepository.getRecipes();

      return Result.success([
        'All',
        ...results.map((e) => e.category).toSet(),
      ]);
    } catch (e) {
      return const Result.error('GetCategoriesUseCase Error');
    }
  }
}

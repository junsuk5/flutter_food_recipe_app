import 'package:food_recipe_app/core/util/result.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/repository/bookmark_repository.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';

class GetSavedRecipesUseCase {
  final BookmarkRepository _bookmarkRepository;
  final RecipeRepository _recipeRepository;

  const GetSavedRecipesUseCase({
    required BookmarkRepository bookmarkRepository,
    required RecipeRepository recipeRepository,
  })  : _bookmarkRepository = bookmarkRepository,
        _recipeRepository = recipeRepository;

  Future<Result<List<Recipe>>> execute() async {
    try {
      final ids = await _bookmarkRepository.getBookmarkedRecipeIds();
      final results = await _recipeRepository.getRecipes();
      return Result.success(
          results.where((recipe) => ids.contains(recipe.id)).toList());
    } catch (e) {
      return const Result.error('GetSavedRecipesUseCase Error');
    }
  }
}

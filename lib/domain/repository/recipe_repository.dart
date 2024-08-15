import 'package:food_recipe_app/core/util/result.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';

abstract interface class RecipeRepository {
  Future<Result<List<Recipe>>> getRecipes();
}

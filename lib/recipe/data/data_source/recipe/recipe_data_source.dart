import 'package:food_recipe_app/recipe/domain/model/recipe.dart';

abstract interface class RecipeDataSource {
  Future<List<Recipe>> getRecipes();
}

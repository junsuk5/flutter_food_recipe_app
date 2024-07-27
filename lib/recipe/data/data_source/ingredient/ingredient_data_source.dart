import 'package:food_recipe_app/recipe/domain/model/ingredient.dart';

abstract interface class IngredientDataSource {
  Future<List<Ingredient>> getIngredients();
}

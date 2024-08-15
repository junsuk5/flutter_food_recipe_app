import 'package:food_recipe_app/core/util/result.dart';
import 'package:food_recipe_app/domain/model/ingredient.dart';

abstract interface class IngredientRepository {
  Future<Result<List<Ingredient>>> getIngredient();
}

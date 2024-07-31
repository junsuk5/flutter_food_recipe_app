import 'package:freezed_annotation/freezed_annotation.dart';

import 'recipe_ingredient.dart';

part 'recipe.freezed.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required int id,
    required String name,
    required String image,
    required String chef,
    required String time,
    required num rating,
    @Default("Italian") String category,
    required List<RecipeIngredient> ingredients,
  }) = _Recipe;
}

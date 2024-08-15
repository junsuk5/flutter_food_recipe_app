import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_ui_state.freezed.dart';

@freezed
class HomeUiState with _$HomeUiState {
  const factory HomeUiState({
    @Default([]) List<String> categories,
    @Default([]) List<Recipe> currentRecipes,
    @Default([]) List<Recipe> newRecipes,
    required String selectedCategory,
    required User user,
  }) = _HomeUiState;
}

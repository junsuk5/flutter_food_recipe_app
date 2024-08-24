import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_action.freezed.dart';

@freezed
sealed class HomeAction with _$HomeAction {
  const factory HomeAction.onSelectCategory(String category) = OnSelectCategory;

  const factory HomeAction.onTapFilter() = OnTapFilter;

  const factory HomeAction.onTapSearch() = OnTapSearch;

  const factory HomeAction.onTapRecipe(Recipe recipe) = OnTapRecipe;

  const factory HomeAction.onTapFavorite(Recipe recipe) = OnTapFavorite;
}

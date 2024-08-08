import 'package:food_recipe_app/recipe/data/data_source/ingredient/ingredient_data_source.dart';
import 'package:food_recipe_app/recipe/data/data_source/ingredient/mock_ingredient_data_source.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @dev
  @lazySingleton
  IngredientDataSource get ingredientDataSource => MockIngredientDataSource();
}

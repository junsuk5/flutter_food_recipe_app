import 'package:food_recipe_app/data/data_source/ingredient/ingredient_data_source.dart';
import 'package:food_recipe_app/data/data_source/ingredient/mock_ingredient_data_source.dart';
import 'package:food_recipe_app/data/data_source/procedure/mock_procedure_data_source.dart';
import 'package:food_recipe_app/data/data_source/procedure/procedure_data_source.dart';
import 'package:food_recipe_app/data/data_source/profile/mock_profile_data_source.dart';
import 'package:food_recipe_app/data/data_source/profile/profile_data_source.dart';
import 'package:food_recipe_app/data/data_source/recipe/mock_recipe_data_source.dart';
import 'package:food_recipe_app/data/data_source/recipe/recipe_data_source.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DevModule {
  @dev
  @lazySingleton
  IngredientDataSource get ingredientDataSource => MockIngredientDataSource();

  @dev
  @lazySingleton
  ProcedureDataSource get procedureDataSource => MockProcedureDataSource();

  @dev
  @lazySingleton
  RecipeDataSource get recipeDataSource => MockRecipeDataSource();

  @dev
  @lazySingleton
  ProfileDataSource get profileDataSource => MockProfileDataSource();
}

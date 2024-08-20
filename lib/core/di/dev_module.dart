import 'package:food_recipe_app/data/data_source/local/bookmark_data_source.dart';
import 'package:food_recipe_app/data/data_source/local/in_memory_bookmark_data_source_impl.dart';
import 'package:food_recipe_app/data/data_source/remote/ingredient/ingredient_data_source.dart';
import 'package:food_recipe_app/data/data_source/remote/ingredient/mock_ingredient_data_source.dart';
import 'package:food_recipe_app/data/data_source/remote/procedure/mock_procedure_data_source.dart';
import 'package:food_recipe_app/data/data_source/remote/procedure/procedure_data_source.dart';
import 'package:food_recipe_app/data/data_source/remote/profile/mock_profile_data_source.dart';
import 'package:food_recipe_app/data/data_source/remote/profile/profile_data_source.dart';
import 'package:food_recipe_app/data/data_source/remote/recipe/mock_recipe_data_source.dart';
import 'package:food_recipe_app/data/data_source/remote/recipe/recipe_data_source.dart';
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

  @dev
  @lazySingleton
  BookmarkDataSource get bookmarkDataSource => InMemoryBookmarkDataSourceImpl();
}

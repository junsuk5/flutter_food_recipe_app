import 'package:food_recipe_app/di/di_setup.dart';
import 'package:food_recipe_app/recipe/data/repository/ingredient_repository_impl.dart';
import 'package:food_recipe_app/recipe/data/repository/procedure_repository_impl.dart';
import 'package:food_recipe_app/recipe/data/repository/profile_repository_impl.dart';
import 'package:food_recipe_app/recipe/data/repository/recipe_repository_impl.dart';
import 'package:food_recipe_app/recipe/domain/repository/ingredient_repository.dart';
import 'package:food_recipe_app/recipe/domain/repository/procedure_repository.dart';
import 'package:food_recipe_app/recipe/domain/repository/profile_repository.dart';
import 'package:food_recipe_app/recipe/domain/repository/recipe_repository.dart';
import 'package:food_recipe_app/recipe/presentation/recipe_ingredient/recipe_ingredient_view_model.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @lazySingleton
  ProfileRepository get profileRepository =>
      ProfileRepositoryImpl(dataSource: getIt());

  @lazySingleton
  RecipeRepository get recipeRepository =>
      RecipeRepositoryImpl(recipeDataSource: getIt());

  @lazySingleton
  IngredientRepository get ingredientRepository =>
      IngredientRepositoryImpl(datasource: getIt());

  @lazySingleton
  ProcedureRepository get procedureRepository =>
      ProcedureRepositoryImpl(dataSource: getIt());

  @injectable
  RecipeIngredientViewModel get recipeIngredientViewModel =>
      RecipeIngredientViewModel(
        profileRepository: getIt(),
        recipeRepository: getIt(),
        ingredientRepository: getIt(),
        procedureRepository: getIt(),
      );
}

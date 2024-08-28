import 'package:food_recipe_app/core/di/di_setup.dart';
import 'package:food_recipe_app/data/repository/bookmark_repository_impl.dart';
import 'package:food_recipe_app/data/repository/ingredient_repository_impl.dart';
import 'package:food_recipe_app/data/repository/procedure_repository_impl.dart';
import 'package:food_recipe_app/data/repository/profile_repository_impl.dart';
import 'package:food_recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:food_recipe_app/data/repository/saved_recipe_repository_impl.dart';
import 'package:food_recipe_app/data/repository/user_repository_impl.dart';
import 'package:food_recipe_app/domain/repository/bookmark_repository.dart';
import 'package:food_recipe_app/domain/repository/ingredient_repository.dart';
import 'package:food_recipe_app/domain/repository/procedure_repository.dart';
import 'package:food_recipe_app/domain/repository/profile_repository.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';
import 'package:food_recipe_app/domain/repository/saved_recipe_repository.dart';
import 'package:food_recipe_app/domain/repository/user_repository.dart';
import 'package:food_recipe_app/domain/use_case/get_categories_use_case.dart';
import 'package:food_recipe_app/domain/use_case/get_new_recipes_use_case.dart';
import 'package:food_recipe_app/domain/use_case/get_recipes_by_category_use_case.dart';
import 'package:food_recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:food_recipe_app/domain/use_case/get_user_use_case.dart';
import 'package:food_recipe_app/presentation/main/home/home_view_model.dart';
import 'package:food_recipe_app/presentation/main/saved_recipe/saved_recipe_view_model.dart';
import 'package:food_recipe_app/presentation/recipe_ingredient/recipe_ingredient_view_model.dart';
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

  @lazySingleton
  SavedRecipeRepository get savedRecipeRepository =>
      SavedRecipeRepositoryImpl(recipeDataSource: getIt());

  @lazySingleton
  UserRepository get userRepository => UserRepositoryImpl();

  @lazySingleton
  BookmarkRepository get bookmarkRepository => BookmarkRepositoryImpl(getIt());

  @lazySingleton
  GetUserUseCase get getUserUseCase => GetUserUseCase(getIt());

  @lazySingleton
  GetCategoriesUseCase get getCategoriesUseCase =>
      GetCategoriesUseCase(getIt());

  @lazySingleton
  GetRecipesByCategoryUseCase get getRecipesByCategoryUseCase =>
      GetRecipesByCategoryUseCase(getIt());

  @lazySingleton
  GetNewRecipesUseCase get getNewRecipesUseCase =>
      GetNewRecipesUseCase(getIt());

  @lazySingleton
  GetSavedRecipesUseCase get getSavedRecipesUseCase => GetSavedRecipesUseCase(
        bookmarkRepository: getIt(),
        recipeRepository: getIt(),
      );

  @injectable
  RecipeIngredientViewModel get recipeIngredientViewModel =>
      RecipeIngredientViewModel(
        profileRepository: getIt(),
        recipeRepository: getIt(),
        ingredientRepository: getIt(),
        procedureRepository: getIt(),
      );

  @injectable
  HomeViewModel get homeViewModel => HomeViewModel(
        getUserUseCase: getIt(),
        getCategoriesUseCase: getIt(),
        getRecipesByCategoryUseCase: getIt(),
        getNewRecipesUseCase: getIt(),
      );

  @injectable
  HomeCubit provideHomeCubit() {
    return HomeCubit(
      getUserUseCase: getIt(),
      getCategoriesUseCase: getIt(),
      getRecipesByCategoryUseCase: getIt(),
      getNewRecipesUseCase: getIt(),
    );
  }

  @injectable
  SavedRecipeViewModel get savedRecipeViewModel =>
      SavedRecipeViewModel(getIt());
}

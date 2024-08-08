import 'package:food_recipe_app/recipe/data/data_source/ingredient/ingredient_data_source.dart';
import 'package:food_recipe_app/recipe/data/data_source/ingredient/mock_ingredient_data_source.dart';
import 'package:food_recipe_app/recipe/data/data_source/procedure/mock_procedure_data_source.dart';
import 'package:food_recipe_app/recipe/data/data_source/procedure/procedure_data_source.dart';
import 'package:food_recipe_app/recipe/data/data_source/profile/mock_profile_data_source.dart';
import 'package:food_recipe_app/recipe/data/data_source/profile/profile_data_source.dart';
import 'package:food_recipe_app/recipe/data/data_source/recipe/mock_recipe_data_source.dart';
import 'package:food_recipe_app/recipe/data/data_source/recipe/recipe_data_source.dart';
import 'package:food_recipe_app/recipe/data/repository/ingredient_repository_impl.dart';
import 'package:food_recipe_app/recipe/data/repository/procedure_repository_impl.dart';
import 'package:food_recipe_app/recipe/data/repository/profile_repository_impl.dart';
import 'package:food_recipe_app/recipe/data/repository/recipe_repository_impl.dart';
import 'package:food_recipe_app/recipe/domain/model/recipe.dart';
import 'package:food_recipe_app/recipe/domain/repository/ingredient_repository.dart';
import 'package:food_recipe_app/recipe/domain/repository/procedure_repository.dart';
import 'package:food_recipe_app/recipe/domain/repository/profile_repository.dart';
import 'package:food_recipe_app/recipe/domain/repository/recipe_repository.dart';
import 'package:food_recipe_app/recipe/presentation/recipe_ingredient/recipe_ingredient_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<IngredientDataSource>(MockIngredientDataSource());
  getIt.registerSingleton<ProcedureDataSource>(MockProcedureDataSource());
  getIt.registerSingleton<RecipeDataSource>(MockRecipeDataSource());
  getIt.registerSingleton<ProfileDataSource>(MockProfileDataSource());

  getIt.registerSingleton<ProfileRepository>(
    ProfileRepositoryImpl(
      dataSource: getIt(),
    ),
  );
  getIt.registerSingleton<RecipeRepository>(
    RecipeRepositoryImpl(recipeDataSource: getIt()),
  );
  getIt.registerSingleton<IngredientRepository>(
    IngredientRepositoryImpl(datasource: getIt()),
  );
  getIt.registerSingleton<ProcedureRepository>(
    ProcedureRepositoryImpl(dataSource: getIt()),
  );

  getIt.registerSingleton(
    const Recipe(
        id: 0,
        name: 'name',
        image: 'image',
        chef: 'chef',
        time: 'time',
        rating: 0,
        ingredients: []),
  );

  getIt.registerFactory(() => RecipeIngredientViewModel(
        getIt(),
        profileRepository: getIt(),
        recipeRepository: getIt(),
        ingredientRepository: getIt(),
        procedureRepository: getIt(),
      ));
}

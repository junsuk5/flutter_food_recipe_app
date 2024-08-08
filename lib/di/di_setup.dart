import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di_setup.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init(environment: Environment.dev);

// void diSetup() {
//   getIt.registerSingleton<IngredientDataSource>(MockIngredientDataSource());
//   getIt.registerSingleton<ProcedureDataSource>(MockProcedureDataSource());
//   getIt.registerSingleton<RecipeDataSource>(MockRecipeDataSource());
//   getIt.registerSingleton<ProfileDataSource>(MockProfileDataSource());
//
//   getIt.registerSingleton<ProfileRepository>(
//     ProfileRepositoryImpl(
//       dataSource: getIt(),
//     ),
//   );
//   getIt.registerSingleton<RecipeRepository>(
//     RecipeRepositoryImpl(recipeDataSource: getIt()),
//   );
//   getIt.registerSingleton<IngredientRepository>(
//     IngredientRepositoryImpl(datasource: getIt()),
//   );
//   getIt.registerSingleton<ProcedureRepository>(
//     ProcedureRepositoryImpl(dataSource: getIt()),
//   );
//
//   getIt.registerFactory(
//     () => RecipeIngredientViewModel(
//       profileRepository: getIt(),
//       recipeRepository: getIt(),
//       ingredientRepository: getIt(),
//       procedureRepository: getIt(),
//     ),
//   );
// }

import 'package:food_recipe_app/presentation/create_account/create_account_screen.dart';
import 'package:food_recipe_app/presentation/sign_up/sign_up_screen.dart';
import 'package:food_recipe_app/presentation/sing_in/sign_in_screen.dart';
import 'package:food_recipe_app/presentation/splash/splash_screen.dart';
import 'package:food_recipe_app/core/di/di_setup.dart';
import 'package:food_recipe_app/data/data_source/recipe/mock_recipe_data_source.dart';
import 'package:food_recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/presentation/main/main_screen.dart';
import 'package:food_recipe_app/presentation/recipe_ingredient/recipe_ingredient_screen.dart';
import 'package:food_recipe_app/presentation/recipe_ingredient/recipe_ingredient_view_model.dart';
import 'package:food_recipe_app/presentation/search/search_screen.dart';
import 'package:food_recipe_app/presentation/search/search_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/splash_screen',
  routes: [
    // GoRoute(
    //   path: '/home',
    //   builder: (context, state) => HomeScreen(
    //     recipeRepository: MockRecipeRepositoryImpl(),
    //   ),
    // ),
    GoRoute(
      path: '/splash_screen',
      builder: (context, state) => SplashScreen(
        onStartCookingTap: () => context.go('/sign_in'),
      ),
    ),
    GoRoute(
      path: '/sign_in',
      builder: (context, state) => SignInScreen(
        onSignupTap: () {
          context.push('/create_account');
        },
        onSignInTap: () {
          context.go('/main_screen');
        },
      ),
    ),
    GoRoute(
      path: '/create_account',
      builder: (context, state) => const CreateAccountScreen(),
    ),
    GoRoute(
      path: '/sign_up',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/main_screen',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/recipe_ingredient_screen',
      builder: (context, state) {
        final recipe = state.extra as Recipe;
        return ChangeNotifierProvider<RecipeIngredientViewModel>(
            create: (context) => getIt(),
            child: RecipeIngredientScreen(recipe: recipe));
      },
    ),
    GoRoute(
      path: '/search_screen',
      builder: (context, state) {
        return ChangeNotifierProvider<SearchViewModel>(
            create: (context) => SearchViewModel(
                repository: RecipeRepositoryImpl(
                    recipeDataSource: MockRecipeDataSource())),
            child: const SearchScreen());
      },
    ),
  ],
);

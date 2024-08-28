import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/di/di_setup.dart';
import 'package:food_recipe_app/data/data_source/remote/recipe/mock_recipe_data_source.dart';
import 'package:food_recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/presentation/component/pop_up_dialog.dart';
import 'package:food_recipe_app/presentation/component/rate_dialog.dart';
import 'package:food_recipe_app/presentation/create_account/create_account_screen.dart';
import 'package:food_recipe_app/presentation/main/home/home_screen.dart';
import 'package:food_recipe_app/presentation/main/main_screen.dart';
import 'package:food_recipe_app/presentation/main/notification/notification_screen.dart';
import 'package:food_recipe_app/presentation/main/profile/profile_screen.dart';
import 'package:food_recipe_app/presentation/main/saved_recipe/saved_recipe_screen.dart';
import 'package:food_recipe_app/presentation/main/saved_recipe/saved_recipe_view_model.dart';
import 'package:food_recipe_app/presentation/recipe_ingredient/recipe_ingredient_screen.dart';
import 'package:food_recipe_app/presentation/recipe_ingredient/recipe_ingredient_view_model.dart';
import 'package:food_recipe_app/presentation/search/search_screen.dart';
import 'package:food_recipe_app/presentation/search/search_view_model.dart';
import 'package:food_recipe_app/presentation/sign_up/sign_up_screen.dart';
import 'package:food_recipe_app/presentation/sing_in/sign_in_screen.dart';
import 'package:food_recipe_app/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

final _deepLinkRecipeDetail = GoRoute(
  path: 'recipes/:id',
  builder: (context, state) {
    final String id = state.pathParameters['id'] ?? '';
    return ChangeNotifierProvider<RecipeIngredientViewModel>(
      create: (context) => getIt(),
      child: RecipeIngredientScreen(
        recipeId: id,
        onMenuTap: (RecipeIngredientMenu menu) {
          switch (menu) {
            case RecipeIngredientMenu.share:
              showDialog(
                context: context,
                builder: (context) {
                  return PopUpDialog(
                    url: 'recipe://recipe.survivalcoding.com/home/recipes/$id',
                    onPressed: () {
                      // TODO :
                      // viewModel.copyLinkToClipboard(
                      //     'foodrecipe://recipe/${recipe.id}');
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Link Copied',
                            textAlign: TextAlign.right,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            case RecipeIngredientMenu.rateRecipe:
              showDialog(
                context: context,
                builder: (context) {
                  return RateDialog(
                    onChanged: (double value) {
                      // TODO : 별점 주기
                      log(value);
                      Navigator.pop(context);
                    },
                  );
                },
              );
            case RecipeIngredientMenu.review:
            // TODO: Handle this case.
            case RecipeIngredientMenu.save:
            // TODO: Handle this case.
            case RecipeIngredientMenu.unSave:
            // TODO: Handle this case.
          }
        },
      ),
    );
  },
);

// GoRouter configuration
final router = GoRouter(
  navigatorKey: _navigatorKey,
  initialLocation: '/splash_screen',
  routes: [
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
          context.go('/home');
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
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(
          currentPageIndex: navigationShell.currentIndex,
          onDestinationSelected: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          child: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) {
                return const HomeBlocRoot();
              },
              routes: [
                _deepLinkRecipeDetail,
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/saved_recipe',
              builder: (context, state) {
                return ChangeNotifierProvider<SavedRecipeViewModel>(
                  create: (context) => getIt<SavedRecipeViewModel>(),
                  child: SavedRecipeScreen(
                    onTap: (Recipe recipe) {
                      context.push('/recipes/${recipe.id}');
                    },
                  ),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/notification',
              builder: (context, state) {
                return const NotificationScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) {
                return const ProfileScreen();
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/recipes/:id',
      builder: (context, state) {
        final String id = state.pathParameters['id'] ?? '';
        return ChangeNotifierProvider<RecipeIngredientViewModel>(
          create: (context) => getIt(),
          child: RecipeIngredientScreen(
            recipeId: id,
            onMenuTap: (RecipeIngredientMenu menu) {
              switch (menu) {
                case RecipeIngredientMenu.share:
                  showDialog(
                    context: context,
                    builder: (context) {
                      return PopUpDialog(
                        url: 'recipe://recipe.survivalcoding.com/home/recipe/$id',
                        onPressed: () {
                          // TODO :
                          // viewModel.copyLinkToClipboard(
                          //     'foodrecipe://recipe/${recipe.id}');
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Link Copied',
                                textAlign: TextAlign.right,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                case RecipeIngredientMenu.rateRecipe:
                  showDialog(
                    context: context,
                    builder: (context) {
                      return RateDialog(
                        onChanged: (double value) {
                          // TODO : 별점 주기
                          log(value);
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                case RecipeIngredientMenu.review:
                // TODO: Handle this case.
                case RecipeIngredientMenu.save:
                // TODO: Handle this case.
                case RecipeIngredientMenu.unSave:
                // TODO: Handle this case.
              }
            },
          ),
        );
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

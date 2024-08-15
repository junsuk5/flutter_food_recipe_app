import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/util/result.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/model/user.dart';
import 'package:food_recipe_app/domain/use_case/get_categories_use_case.dart';
import 'package:food_recipe_app/domain/use_case/get_new_recipes_use_case.dart';
import 'package:food_recipe_app/domain/use_case/get_recipes_by_category_use_case.dart';
import 'package:food_recipe_app/domain/use_case/get_user_use_case.dart';
import 'package:food_recipe_app/presentation/main/home/home_ui_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetUserUseCase _getUserUseCase;
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetRecipesByCategoryUseCase _getRecipesByCategoryUseCase;
  final GetNewRecipesUseCase _getNewRecipesUseCase;

  HomeViewModel({
    required GetUserUseCase getUserUseCase,
    required GetCategoriesUseCase getCategoriesUseCase,
    required GetRecipesByCategoryUseCase getRecipesByCategoryUseCase,
    required GetNewRecipesUseCase getNewRecipesUseCase,
  })  : _getUserUseCase = getUserUseCase,
        _getCategoriesUseCase = getCategoriesUseCase,
        _getRecipesByCategoryUseCase = getRecipesByCategoryUseCase,
        _getNewRecipesUseCase = getNewRecipesUseCase {
    fetchUser();
    fetchCategories();
    fetchDishes('All');
    fetchNewRecipes();
  }

  HomeUiState _state = const HomeUiState(
    user: User(
      id: 0,
      name: '',
      email: '',
      image: '',
    ),
    selectedCategory: 'All',
  );

  HomeUiState get state => _state;

  Future<void> fetchUser() async {
    final result = await _getUserUseCase.execute();
    switch (result) {
      case Success<User>():
        _state = state.copyWith(user: result.data);
        notifyListeners();
      case Error<User>():
      // TODO: Handle this case.
    }
  }

  Future<void> fetchCategories() async {
    final result = await _getCategoriesUseCase.execute();
    switch (result) {
      case Success<List<String>>():
        _state = state.copyWith(categories: result.data);
        notifyListeners();
      case Error<List<String>>():
      // TODO: Handle this case.
    }
  }

  Future<void> fetchDishes(String category) async {
    final result = await _getRecipesByCategoryUseCase.execute(category);
    switch (result) {
      case Success<List<Recipe>>():
        _state = state.copyWith(
          currentRecipes: result.data,
        );
        notifyListeners();
      case Error<List<Recipe>>():
      // TODO: Handle this case.
    }
  }

  Future<void> fetchNewRecipes() async {
    final result = await _getNewRecipesUseCase.execute();
    switch (result) {
      case Success<List<Recipe>>():
        _state = state.copyWith(newRecipes: result.data);
        notifyListeners();
      case Error<List<Recipe>>():
      // TODO: Handle this case.
    }
  }

  void onSelectCategory(String category) async {
    _state = state.copyWith(selectedCategory: category);
    notifyListeners();

    await fetchDishes(category);
  }
}

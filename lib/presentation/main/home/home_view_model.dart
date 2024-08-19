import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/util/result.dart';
import 'package:food_recipe_app/domain/filter/filter_search_state.dart';
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
    _fetchUser();
    _fetchCategories();
    _fetchDishes('All');
    _fetchNewRecipes();
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

  Future<void> _fetchUser() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _getUserUseCase.execute();
    switch (result) {
      case Success<User>():
        _state = state.copyWith(
          user: result.data,
          isLoading: false,
        );
        notifyListeners();
      case Error<User>():
      // TODO: Handle this case.
    }
  }

  Future<void> _fetchCategories() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _getCategoriesUseCase.execute();
    switch (result) {
      case Success<List<String>>():
        _state = state.copyWith(
          categories: result.data,
          isLoading: false,
        );
        notifyListeners();
      case Error<List<String>>():
      // TODO: Handle this case.
    }
  }

  Future<void> _fetchDishes(String category) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _getRecipesByCategoryUseCase.execute(category);
    switch (result) {
      case Success<List<Recipe>>():
        _state = state.copyWith(
          currentRecipes: result.data,
          isLoading: false,
        );
        notifyListeners();
      case Error<List<Recipe>>():
      // TODO: Handle this case.
    }
  }

  Future<void> _fetchNewRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _getNewRecipesUseCase.execute();
    switch (result) {
      case Success<List<Recipe>>():
        _state = state.copyWith(
          newRecipes: result.data,
          isLoading: false,
        );
        notifyListeners();
      case Error<List<Recipe>>():
      // TODO: Handle this case.
    }
  }

  void onSelectCategory(String category) async {
    _state = state.copyWith(selectedCategory: category);
    notifyListeners();

    await _fetchDishes(category);
  }

  void onChangeFilter(FilterSearchState filterState) async {
    _state = state.copyWith(
      filterState: filterState
    );
    notifyListeners();

    // TODO: 필터 적용
    log(state.filterState.toString());
  }
}

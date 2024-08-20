import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/util/result.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/use_case/get_saved_recipes_use_case.dart';

class SavedRecipeViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  bool _isLoading = false;

  SavedRecipeViewModel(this._getSavedRecipesUseCase) {
    fetchRecipes();
  }

  List<Recipe> _recipes = [];

  List<Recipe> get recipes => List.unmodifiable(_recipes);

  bool get isLoading => _isLoading;

  void fetchRecipes() async {
    _isLoading = true;
    notifyListeners();

    final result = await _getSavedRecipesUseCase.execute();
    switch (result) {
      case Success<List<Recipe>>():
        _recipes = result.data;
        _isLoading = false;
        notifyListeners();
      case Error<List<Recipe>>():
        log(result.message);
    }
  }
}

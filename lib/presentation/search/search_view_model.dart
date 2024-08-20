import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';

class SearchViewModel with ChangeNotifier {
  final RecipeRepository repository;

  SearchViewModel({
    required this.repository,
  }) {
    fetchRecipes();
  }

  List<Recipe> _recipes = [];
  bool _isLoading = false;

  List<Recipe> get recipes => _recipes;

  bool get isLoading => _isLoading;

  void fetchRecipes() async {
    _isLoading = true;
    notifyListeners();

    try {
      _recipes = await repository.getRecipes();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      log('fetchRecipes() Error');
    }
  }

  void search(String value) async {
    try {
      final results = await repository.getRecipes();
      _recipes = results
          .where((e) => e.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      notifyListeners();
    } catch (e) {
      log('search() Error');
    }
  }
}

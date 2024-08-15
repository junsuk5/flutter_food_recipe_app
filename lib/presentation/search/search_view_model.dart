import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/util/result.dart';
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

    final result = await repository.getRecipes();
    switch (result) {
      case Success<List<Recipe>>():
        _recipes = result.data;
        _isLoading = false;
        notifyListeners();
      case Error<List<Recipe>>():
        log(result.message);
    }
  }

  void search(String value) async {
    final result = await repository.getRecipes();
    switch (result) {
      case Success<List<Recipe>>():
        _recipes = result.data
            .where((e) => e.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
        notifyListeners();
      case Error<List<Recipe>>():
        log(result.message);
    }
  }
}

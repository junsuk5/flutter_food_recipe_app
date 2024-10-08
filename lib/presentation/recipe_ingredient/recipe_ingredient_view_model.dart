import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/util/result.dart';
import 'package:food_recipe_app/domain/model/procedure.dart';
import 'package:food_recipe_app/domain/model/profile.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/repository/ingredient_repository.dart';
import 'package:food_recipe_app/domain/repository/procedure_repository.dart';
import 'package:food_recipe_app/domain/repository/profile_repository.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';

class RecipeIngredientViewModel with ChangeNotifier {
  final RecipeRepository recipeRepository;
  final IngredientRepository ingredientRepository;
  final ProcedureRepository procedureRepository;
  final ProfileRepository profileRepository;

  RecipeIngredientViewModel({
    required this.profileRepository,
    required this.recipeRepository,
    required this.ingredientRepository,
    required this.procedureRepository,
  });

  Future<void> initProfile(Recipe recipe) async {
    await getProfile(recipe.chef);
    await getProcedures(recipe.id);
  }

  List<Procedure> _procedureList = [];

  Profile _chef = const Profile(
    id: 0,
    name: 'name',
    image:
        'https://cdn.pixabay.com/photo/2018/11/03/15/51/here-3792307_1280.png',
    address: 'address',
  );
  final Set<Profile> _followingSet = {};
  int _currentTabIndex = 0;

  List<Procedure> get procedureList => _procedureList;

  int get currentTabIndex => _currentTabIndex;

  Profile get chef => _chef;

  Set<Profile> get followingSet => _followingSet;

  Recipe? _recipe;

  Recipe? get recipe => _recipe;

  bool _isFollowing = false;

  bool get isFollowing => _isFollowing;

  void onTabFollow() {
    _isFollowing = !_isFollowing;
    notifyListeners();
  }

  void onTabUnSave() {
    // TODO : UnSave
    notifyListeners();
  }

  void updateTab(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  void fetchRecipe(String id) async {
    _recipe = await recipeRepository.getRecipe(int.parse(id));
    notifyListeners();
  }

  Future<void> getProcedures(int recipeId) async {
    final result = await procedureRepository.getProcedures();
    switch (result) {
      case Success<List<Procedure>>():
        _procedureList = result.data
            .where((e) => e.recipeId == recipeId)
            .sorted((a, b) => a.step.compareTo(b.step));
        notifyListeners();
      case Error<List<Procedure>>():
    }
  }

  Future<void> getProfile(String name) async {
    final result = await profileRepository.getProfiles();
    switch (result) {
      case Success<List<Profile>>():
        _chef = result.data.firstWhere((e) => e.name == name);
        notifyListeners();
      case Error<List<Profile>>():
    }
  }

  void changeFollow(Profile profile) {
    if (followingSet.contains(profile)) {
      followingSet.remove(profile);
    } else {
      followingSet.add(profile);
    }
    notifyListeners();
  }
}

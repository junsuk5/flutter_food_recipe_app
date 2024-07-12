import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/recipe/domain/model/recipe.dart';
import 'package:food_recipe_app/recipe/domain/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  @override
  Future<Result<List<Recipe>>> getSavedRecipes() async {
    await Future.delayed(const Duration(seconds: 1));

    return const Result.success([
      Recipe(name: '떡볶이'),
      Recipe(name: '짜장면'),
      Recipe(name: '탕수육'),
    ]);
  }
}

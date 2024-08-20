import 'package:collection/collection.dart';
import 'package:food_recipe_app/data/data_source/remote/recipe/recipe_data_source.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  const RecipeRepositoryImpl({
    required RecipeDataSource recipeDataSource,
  }) : _recipeDataSource = recipeDataSource;

  @override
  Future<List<Recipe>> getRecipes() async {
    return await _recipeDataSource.getRecipes();
  }

  @override
  Future<Recipe?> getRecipe(int id) async {
    return (await _recipeDataSource.getRecipes())
        .firstWhereOrNull((e) => e.id == id);
  }
}

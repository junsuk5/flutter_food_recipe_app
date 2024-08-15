// import 'package:flutter/material.dart';
// import 'package:food_recipe_app/core/presentation/component/recipe_card.dart';
// import 'package:food_recipe_app/core/result.dart';
// import 'package:food_recipe_app/recipe/domain/model/recipe.dart';
// import 'package:food_recipe_app/recipe/domain/repository/recipe_repository.dart';
//
// class SavedRecipeView extends StatelessWidget {
//   final RecipeRepository recipeRepository;
//
//   const SavedRecipeView({
//     super.key,
//     required this.recipeRepository,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Result<List<Recipe>>>(
//         future: recipeRepository.getSavedRecipes(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           final result = snapshot.data!;
//
//           switch (result) {
//             case Success<List<Recipe>>():
//               return ListView(
//                 children:
//                     result.data.map((e) => RecipeCard(recipe: e)).toList(),
//               );
//             case Error<List<Recipe>>():
//               return Center(child: Text(result.message));
//           }
//         });
//   }
// }

import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/presentation/component/recipe_category_picker.dart';
import 'package:food_recipe_app/core/presentation/component/dish_card.dart';
import 'package:food_recipe_app/core/presentation/component/new_recipe_card.dart';
import 'package:food_recipe_app/core/presentation/component/small_box.dart';
import 'package:food_recipe_app/core/presentation/component/text_field_for_move.dart';
import 'package:food_recipe_app/recipe/domain/model/recipe.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final state = viewModel.state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 30.0, top: 70, right: 30.0, bottom: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello ${viewModel.state.user.name}',
                    style: TextStyles.largeTextBold,
                  ),
                  Text(
                    'what are you cooking today?',
                    style: TextStyles.smallerTextBold
                        .copyWith(color: ColorStyles.gray4),
                  )
                ],
              ),
              Skeletonizer(
                enabled: viewModel.state.user.image.isEmpty,
                child: SmallBox(image: viewModel.state.user.image),
              ),
            ],
          ),
        ),
        const TextFieldForMove(
            hintText: 'Search recipe', path: '/search_screen'),
        // 카테고리 선택
        Skeletonizer(
          enabled: state.categories.isEmpty,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: RecipeCategoryPicker(
              categories: state.categories,
              selectedCategory: state.selectedCategory,
              onTapCategory: (String category) {
                viewModel.onSelectCategory(category);
              },
            ),
          ),
        ),
        // Dishes
        Skeletonizer(
          enabled: viewModel.state.currentRecipes.isEmpty,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, bottom: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: viewModel.state.currentRecipes
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: DishCard(
                          recipe: e,
                          isFavorite: true,
                          onTapFavorite: (Recipe recipe) {
                            print('onTapFavorite');
                          },
                          onTapDish: (Recipe recipe) {
                            print('onTapDish');
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(30, 20, 0, 5),
          child: Text(
            'New Recipes',
            style: TextStyles.normalTextBold,
          ),
        ),
        Skeletonizer(
          enabled: viewModel.state.newRecipes.isEmpty,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: viewModel.state.newRecipes
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: NewRecipeCard(recipe: e),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

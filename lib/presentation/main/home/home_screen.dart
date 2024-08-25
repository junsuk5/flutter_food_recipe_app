import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/di/di_setup.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/presentation/component/dish_card.dart';
import 'package:food_recipe_app/presentation/component/new_recipe_card.dart';
import 'package:food_recipe_app/presentation/component/recipe_category_picker.dart';
import 'package:food_recipe_app/presentation/component/small_box.dart';
import 'package:food_recipe_app/presentation/component/text_field_for_move.dart';
import 'package:food_recipe_app/presentation/main/home/component/filter_search_sheet.dart';
import 'package:food_recipe_app/presentation/main/home/home_action.dart';
import 'package:food_recipe_app/presentation/main/home/home_ui_state.dart';
import 'package:food_recipe_app/presentation/main/home/home_view_model.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeRoot extends StatelessWidget {
  const HomeRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => getIt<HomeViewModel>(),
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          final state = viewModel.state;
          return HomeScreen(
            state: state,
            onAction: (action) {
              switch (action) {
                case OnSelectCategory():
                  viewModel.onSelectCategory(action.category);
                case OnTapFilter():
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return FilterSearchSheet(
                        onChangeFilter: (filter) {
                          viewModel.onChangeFilter(filter);
                          Navigator.pop(context);
                        },
                        state: state.filterState,
                      );
                    },
                  );
                case OnTapSearch():
                  context.push('/search_screen');
                case OnTapRecipe():
                  context.push('/recipes/${action.recipe.id}');
                case OnTapFavorite():
                // TODO: Handle this case.
              }
            },
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final HomeUiState state;
  final void Function(HomeAction) onAction;

  const HomeScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
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
                    'Hello ${state.user.name}',
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
                enabled: state.isLoading,
                child: SmallBox(image: state.user.image),
              ),
            ],
          ),
        ),
        TextFieldForMove(
          hintText: 'Search recipe',
          onTapSearch: () => onAction(const HomeAction.onTapSearch()),
          onTapFilter: () => onAction(const HomeAction.onTapFilter()),
        ),
        // 카테고리 선택
        Skeletonizer(
          enabled: state.isLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: RecipeCategoryPicker(
              categories: state.categories,
              selectedCategory: state.selectedCategory,
              onTapCategory: (String category) {
                onAction(HomeAction.onSelectCategory(category));
              },
            ),
          ),
        ),
        // Dishes
        Skeletonizer(
          enabled: state.isLoading,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, bottom: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: state.currentRecipes
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: DishCard(
                          recipe: e,
                          isFavorite: true,
                          onTapFavorite: (Recipe recipe) {
                            log('onTapFavorite');
                          },
                          onTapDish: (Recipe recipe) {
                            onAction(HomeAction.onTapRecipe(recipe));
                            log('onTapDish');
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
          enabled: state.isLoading,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: state.newRecipes
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

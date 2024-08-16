import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/component/chef_profile.dart';
import 'package:food_recipe_app/presentation/component/ingredient_card.dart';
import 'package:food_recipe_app/presentation/component/procedure_card.dart';
import 'package:food_recipe_app/presentation/component/recipe_picture.dart';
import 'package:food_recipe_app/presentation/recipe_ingredient/recipe_ingredient_view_model.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

enum RecipeIngredientMenu {
  share,
  rateRecipe,
  review,
  save,
  unSave,
}

class RecipeIngredientScreen extends StatefulWidget {
  final String recipeId;
  final ValueChanged<RecipeIngredientMenu> onMenuTap;

  const RecipeIngredientScreen({
    super.key,
    required this.recipeId,
    required this.onMenuTap,
  });

  @override
  State<RecipeIngredientScreen> createState() => _RecipeIngredientScreenState();
}

class _RecipeIngredientScreenState extends State<RecipeIngredientScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);

    Future.microtask(() {
      if (mounted) {
        context.read<RecipeIngredientViewModel>().fetchRecipe(widget.recipeId);
      }
    });
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      final viewModel = context.read<RecipeIngredientViewModel>();
      viewModel.updateTab(_tabController.index);
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RecipeIngredientViewModel>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.more_horiz),
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: const Text('share'),
                    onTap: () => widget.onMenuTap(RecipeIngredientMenu.share),
                  ),
                  PopupMenuItem(
                    child: const Text('Rate Recipe'),
                    onTap: () =>
                        widget.onMenuTap(RecipeIngredientMenu.rateRecipe),
                  ),
                  PopupMenuItem(
                    child: const Text('Review'),
                    onTap: () => widget.onMenuTap(RecipeIngredientMenu.review),
                  ),
                  PopupMenuItem(
                    child: const Text('Unsave'),
                    onTap: () => widget.onMenuTap(RecipeIngredientMenu.save),
                  ),
                ];
              },
            ),
          ],
        ),
        body: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(
            //     top: 54.0,
            //     left: 20.0,
            //     right: 24.0,
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       IconButton(
            //         onPressed: () => context.pop(),
            //         icon: const Icon(Icons.arrow_back),
            //         padding: EdgeInsets.zero,
            //       ),
            //       PopupMenuButton(
            //         icon: const Icon(Icons.more_horiz),
            //         padding: EdgeInsets.zero,
            //         itemBuilder: (BuildContext context) {
            //           return [
            //             const PopupMenuItem(child: Text('share')),
            //             const PopupMenuItem(child: Text('Rate Recipe')),
            //             const PopupMenuItem(child: Text('Review')),
            //             const PopupMenuItem(child: Text('Unsave')),
            //           ];
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            Skeletonizer(
              enabled: viewModel.recipe == null,
              child: RecipePicture(recipe: viewModel.recipe!),
            ),
            ChefProfile(
              profile: viewModel.chef,
              onTap: (profile) {
                viewModel.changeFollow(profile);
              },
              isFollowing: viewModel.followingSet.contains(viewModel.chef),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                controller: _tabController,
                tabs: const [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 13.0, bottom: 13.0, right: 45.0, left: 45.0),
                    child:
                        Text('Ingredient', style: TextStyles.smallerTextBold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 13.0, bottom: 13.0, right: 45.0, left: 45.0),
                    child: Text('Procedure', style: TextStyles.smallerTextBold),
                  ),
                ],
                // TabBar 스타일 지정
                labelColor: ColorStyles.white,
                unselectedLabelColor: ColorStyles.primary100,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  color: ColorStyles.primary100, // 선택된 탭 배경색
                  borderRadius: BorderRadius.circular(15),
                  // 선택된 탭 모서리 둥글게
                ),
                dividerColor: Colors.transparent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, bottom: 15.0, top: 14.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/dish_icon.png',
                    width: 17,
                  ),
                  Text(
                    '1 serve',
                    style: TextStyles.smallerTextRegular
                        .copyWith(color: ColorStyles.gray3),
                  ),
                  const Spacer(),
                  Text(
                    _tabController.index == 0
                        ? '${viewModel.recipe?.ingredients.length ?? 0} items'
                        : '${viewModel.procedureList.length} steps',
                    style: TextStyles.smallerTextRegular
                        .copyWith(color: ColorStyles.gray3),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView(
                      padding: EdgeInsets.zero,
                      children: (viewModel.recipe?.ingredients ?? [])
                          .map((e) => IngredientCard(recipeIngredient: e))
                          .toList()),
                  ListView(
                      padding: EdgeInsets.zero,
                      children: viewModel.procedureList
                          .map((e) => ProcedureCard(procedure: e))
                          .toList())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

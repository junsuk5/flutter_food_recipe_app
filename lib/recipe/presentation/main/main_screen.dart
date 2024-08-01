import 'package:flutter/material.dart';
import 'package:food_recipe_app/recipe/data/data_source/recipe/mock_recipe_data_source.dart';
import 'package:food_recipe_app/recipe/data/data_source/saved_recipe/mock_saved_recipe_data_source.dart';
import 'package:food_recipe_app/recipe/data/repository/mock_recipe_repository_impl.dart';
import 'package:food_recipe_app/recipe/data/repository/recipe_repository_impl.dart';
import 'package:food_recipe_app/recipe/data/repository/saved_recipe_repository_impl.dart';
import 'package:food_recipe_app/recipe/data/repository/user_repository_impl.dart';
import 'package:food_recipe_app/recipe/domain/model/user.dart';
import 'package:food_recipe_app/recipe/domain/repository/saved_recipe_repository.dart';
import 'package:food_recipe_app/recipe/domain/use_case/get_categories_use_case.dart';
import 'package:food_recipe_app/recipe/domain/use_case/get_recipes_by_category_use_case.dart';
import 'package:food_recipe_app/recipe/domain/use_case/get_user_use_case.dart';
import 'package:food_recipe_app/recipe/presentation/main/home/home_view_model.dart';
import 'package:food_recipe_app/recipe/presentation/main/notification/notification_screen.dart';
import 'package:food_recipe_app/recipe/presentation/main/profile/profile_screen.dart';
import 'package:food_recipe_app/recipe/presentation/main/saved_recipe/saved_recipe_screen.dart';
import 'package:food_recipe_app/recipe/presentation/main/saved_recipe/saved_recipe_view_model.dart';
import 'package:provider/provider.dart';

import 'home/home_screen.dart';

class MainScreen extends StatefulWidget {
  final SavedRecipeRepository repository;

  const MainScreen({super.key, required this.repository});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;
  late final List<Widget> _screen;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysHide;

  final destination = [
    NavigationDestination(
        icon: Image.asset('assets/images/unselected_home.png'),
        selectedIcon: Image.asset(
          'assets/images/selected_home.png',
        ),
        label: 'home'),
    NavigationDestination(
      icon: Image.asset('assets/images/unselected_book_mark.png'),
      selectedIcon: Image.asset('assets/images/selected_book_mark.png'),
      label: 'saved',
    ),
    NavigationDestination(
        icon: Image.asset('assets/images/unselected_alert.png'),
        selectedIcon: Image.asset('assets/images/selected_alert.png'),
        label: 'notifications'),
    NavigationDestination(
        icon: Image.asset('assets/images/unselected_man.png'),
        selectedIcon: Image.asset('assets/images/selected_man.png'),
        label: 'profile')
  ];

  @override
  void initState() {
    _screen = [
      ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(
                getUserUseCase: GetUserUseCase(UserRepositoryImpl()),
                getCategoriesUseCase: GetCategoriesUseCase(
                  MockRecipeRepositoryImpl(),
                ),
                getRecipesByCategoryUseCase: GetRecipesByCategoryUseCase(
                    RecipeRepositoryImpl(
                        recipeDataSource: MockRecipeDataSource())),
              ),
          child: const HomeScreen()),
      ChangeNotifierProvider<SavedRecipeViewModel>(
          create: (context) => SavedRecipeViewModel(
                SavedRecipeRepositoryImpl(
                  recipeDataSource: MockRecipeDataSource(),
                ),
              ),
          child: const SavedRecipeScreen()),
      const NotificationScreen(),
      const ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        height: 58,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        destinations: destination,
        labelBehavior: labelBehavior,
        selectedIndex: currentPageIndex,
        indicatorColor: Colors.transparent,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}

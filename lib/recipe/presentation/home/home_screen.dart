import 'package:flutter/material.dart';
import 'package:food_recipe_app/recipe/domain/repository/recipe_repository.dart';
import 'package:food_recipe_app/recipe/presentation/home/view/saved_recipe_view.dart';

class HomeScreen extends StatefulWidget {
  final RecipeRepository recipeRepository;

  const HomeScreen({
    super.key,
    required this.recipeRepository,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedIndex: currentIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: ''),
          NavigationDestination(icon: Icon(Icons.home), label: ''),
          NavigationDestination(icon: Icon(Icons.home), label: ''),
          NavigationDestination(icon: Icon(Icons.home), label: ''),
        ],
      ),
      body: SavedRecipeView(
        recipeRepository: widget.recipeRepository,
      ),
    );
  }
}

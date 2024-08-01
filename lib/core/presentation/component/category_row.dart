import 'package:flutter/material.dart';
import 'package:food_recipe_app/ui/color_styles.dart';

class CategoryRow extends StatelessWidget {
  final void Function(String category) onTapCategory;

  final List<String> categories;
  final String selectedCategory;

  const CategoryRow({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onTapCategory,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((e) {
          if (e == selectedCategory) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque, // 패딩에 클릭 먹게
              onTap: () => onTapCategory(e),
              child: SelectedCategory(category: e),
            );
          }
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onTapCategory(e),
            child: UnSelectedCategory(category: e),
          );
        }).toList(),
      ),
    );
  }
}

class UnSelectedCategory extends StatelessWidget {
  final String category;

  const UnSelectedCategory({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
      child: Text(
        category,
        style: const TextStyle(color: ColorStyles.primary80),
      ),
    );
  }
}

class SelectedCategory extends StatelessWidget {
  final String category;

  const SelectedCategory({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: ColorStyles.primary100,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Text(
        category,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

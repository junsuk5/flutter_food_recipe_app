import 'package:flutter/material.dart';
import 'package:food_recipe_app/recipe/domain/model/recipe.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class DishCard extends StatelessWidget {
  final Recipe recipe;
  final bool isFavorite;

  final void Function(Recipe recipe) onTapFavorite;
  final void Function(Recipe recipe) onTapDish;

  const DishCard({
    super.key,
    required this.recipe,
    required this.isFavorite,
    required this.onTapFavorite,
    required this.onTapDish,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapDish(recipe),
      child: SizedBox(
        width: 150,
        height: 230,
        child: Stack(
          children: [
            // 배경
            Positioned(
              bottom: 0,
              child: Container(
                width: 150,
                height: 176,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: ColorStyles.gray4,
                ),
                child: Center(
                  child: Text(
                    recipe.name,
                    textAlign: TextAlign.center,
                    style: TextStyles.normalTextBold.copyWith(
                      color: ColorStyles.gray1,
                    ),
                  ),
                ),
              ),
            ),
            // Time
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                recipe.time,
                style: TextStyles.smallerTextBold.copyWith(
                  color: ColorStyles.gray1,
                ),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 32,
              child: Text(
                'Time',
                style: TextStyles.smallTextRegular.copyWith(
                  color: ColorStyles.gray3,
                ),
              ),
            ),
            // 북마크 아이콘
            Positioned(
              right: 10,
              bottom: 10,
              child: GestureDetector(
                onTap: () => onTapFavorite(recipe),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: isFavorite
                      ? Image.asset(
                          'assets/images/selected_union.png',
                          width: 16,
                          height: 16,
                        )
                      : Image.asset(
                          'assets/images/unselected_union.png',
                          width: 16,
                          height: 16,
                        ),
                ),
              ),
            ),
            // Image
            Positioned(
              left: 0,
              right: 0,
              child: SizedBox(
                width: 110,
                height: 110,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    recipe.image,
                  ),
                ),
              ),
            ),
            // Rating
            Positioned(
              right: 0,
              top: 30,
              child: Container(
                width: 45,
                height: 23,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: ColorStyles.secondary20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: ColorStyles.rating,
                      size: 10,
                    ),
                    Text(
                      recipe.rating.toString(),
                      style: TextStyles.smallTextRegular,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

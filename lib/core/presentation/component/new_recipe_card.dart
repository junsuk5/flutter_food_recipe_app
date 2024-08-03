import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_recipe_app/recipe/domain/model/recipe.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class NewRecipeCard extends StatelessWidget {
  final Recipe recipe;

  const NewRecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 127,
      child: Stack(
        children: [
          Positioned(
            top: 32,
            child: Container(
              width: 250,
              height: 95,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9.3,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 140,
                      height: 23,
                      child: Text(
                        recipe.name,
                        style: TextStyles.smallTextBold.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: List.generate(
                        recipe.rating.toInt(),
                        (e) => const Icon(
                          size: 12,
                          Icons.star,
                          color: ColorStyles.rating,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              recipe.image,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'By ${recipe.chef}',
                          style: TextStyles.smallerTextRegular.copyWith(
                            color: ColorStyles.gray3,
                          ),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/images/timer.png',
                          width: 17,
                          height: 17,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          recipe.time,
                          style: TextStyles.smallerTextRegular.copyWith(
                            color: ColorStyles.gray3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 9.3,
            child: SizedBox(
              width: 80,
              height: 86,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  recipe.image,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

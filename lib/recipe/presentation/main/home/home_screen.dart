import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/presentation/component/small_box.dart';
import 'package:food_recipe_app/core/presentation/component/text_field_for_move.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:provider/provider.dart';

import 'home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Column(
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
                    'Hello ${viewModel.user.name}',
                    style: TextStyles.largeTextBold,
                  ),
                  Text(
                    'what are you cooking today?',
                    style: TextStyles.smallerTextBold
                        .copyWith(color: ColorStyles.gray4),
                  )
                ],
              ),
              SmallBox(image: viewModel.user.image)
            ],
          ),
        ),
        const TextFieldForMove(
            hintText: 'Search recipe', path: '/search_screen')
      ],
    );
  }
}

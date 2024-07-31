import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_recipe_app/core/presentation/component/small_box.dart';
import 'package:food_recipe_app/core/presentation/component/text_field_for_move.dart';
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
        Skeletonizer(
          enabled: viewModel.state.categories.isEmpty,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: viewModel.state.categories.map((e) {
                  if (e == 'All') {
                    return Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: ColorStyles.primary100,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 7),
                      child: Text(
                        e,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                    child: Text(
                      e,
                      style: const TextStyle(color: ColorStyles.primary80),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

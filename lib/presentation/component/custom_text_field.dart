import 'package:flutter/material.dart';
import 'package:food_recipe_app/ui/color_styles.dart';

import '../../ui/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String placeHolderText;
  final void Function(String value)? onChanged;

  const CustomTextField({
    super.key,
    required this.title,
    required this.placeHolderText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.smallTextRegular.copyWith(
            color: ColorStyles.labelColour,
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: placeHolderText,
            hintStyle: const TextStyle(color: ColorStyles.gray4),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: ColorStyles.gray4),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: ColorStyles.gray4),
            ),
          ),
          onChanged: (value) => onChanged?.call(value),
        )
      ],
    );
  }
}

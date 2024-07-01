import 'package:flutter/material.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class CustomCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final void Function(bool?) onChanged;

  const CustomCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Row(
        children: [
          Checkbox(
            side: const BorderSide(color: ColorStyles.secondaryColor),
            value: value,
            onChanged: (newValue) => onChanged(newValue),
          ),
          Text(
            label,
            style: TextStyles.smallTextRegular
                .copyWith(color: ColorStyles.secondaryColor),
          ),
        ],
      ),
    );
  }
}

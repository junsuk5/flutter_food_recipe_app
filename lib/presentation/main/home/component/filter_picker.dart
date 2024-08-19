import 'package:flutter/material.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class FilterPicker extends StatelessWidget {
  final List<String> items;
  final String selectedItem;
  final ValueChanged<String> onChangeValue;

  const FilterPicker({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onChangeValue,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: items.expand((item) {
        return [
          GestureDetector(
            onTap: () => onChangeValue(item),
            child: item == selectedItem
                ? SelectedChip(text: item)
                : UnSelectedChip(text: item),
          ),
          const SizedBox(width: 10),
        ];
      }).toList()
        ..removeLast(),
    );
  }
}

class UnSelectedChip extends StatelessWidget {
  final String text;

  const UnSelectedChip({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        text,
        style: TextStyles.smallerTextRegular
            .copyWith(color: ColorStyles.primaryColor),
      ),
      side: const BorderSide(color: ColorStyles.primaryColor),
    );
  }
}

class SelectedChip extends StatelessWidget {
  final String text;

  const SelectedChip({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: ColorStyles.primaryColor,
      label: Text(
        text,
        style: TextStyles.smallerTextRegular.copyWith(color: ColorStyles.white),
      ),
      side: const BorderSide(color: ColorStyles.primaryColor),
    );
  }
}

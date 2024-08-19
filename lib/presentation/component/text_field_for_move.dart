import 'package:flutter/material.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class TextFieldForMove extends StatelessWidget {
  final String hintText;
  final void Function() onTapSearch;
  final void Function() onTapFilter;

  const TextFieldForMove({
    super.key,
    required this.hintText,
    required this.onTapSearch,
    required this.onTapFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onTapSearch,
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: ColorStyles.gray4),
                      ),
                      hintText: hintText,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: ColorStyles.gray4,
                      ),
                      hintStyle: TextStyles.smallerTextRegular
                          .copyWith(color: ColorStyles.gray4)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: GestureDetector(
              onTap: onTapFilter,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorStyles.primary100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/filter.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

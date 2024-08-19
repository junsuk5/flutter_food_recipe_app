import 'package:flutter/material.dart';
import 'package:food_recipe_app/ui/color_styles.dart';

import '../../ui/text_styles.dart';

class SmallButton extends StatefulWidget {
  final String text;
  final void Function()? onPressed;

  const SmallButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
          widget.onPressed?.call();
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), // 모든 코너를 10.0의 반경으로 둥글게 설정
            color: !isPressed ? ColorStyles.primaryColor : ColorStyles.gray4,
          ),
          width: 174,
          height: 37,
          child: Center(
            child: Text(
              widget.text,
              style: TextStyles.smallerTextBold.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_recipe_app/ui/color_styles.dart';

import '../../ui/text_styles.dart';

class BigButton extends StatefulWidget {
  final String text;
  final void Function()? onPressed;

  const BigButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // 모든 코너를 10.0의 반경으로 둥글게 설정
          color: !isPressed ? ColorStyles.primaryColor : ColorStyles.gray4,
        ),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyles.normalTextBold.copyWith(color: Colors.white),
            ),
            const SizedBox(width: 30),
            const Icon(Icons.arrow_forward_sharp,
                color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

abstract class TextStyles {
  static const TextStyle headerTextBold = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle largeTextRegular = TextStyle(fontSize: 20);
  static const TextStyle largeTextBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle mediumTextBold = TextStyle(fontSize: 18);
  static const TextStyle smallTextRegular = TextStyle(fontSize: 14);
  static const TextStyle normalTextRegular = TextStyle(fontSize: 16);
  static const TextStyle normalTextBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle smallTextSemiBold = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
  );
}

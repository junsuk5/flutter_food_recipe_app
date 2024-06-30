import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_recipe_app/presentation/components/medium_button.dart';

import '../../ui/text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/splash_image.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.contain,
          ),
          Align(
            child: Column(
              children: [
                const SizedBox(height: 100),
                Image.asset(
                  'assets/crown.png',
                  width: 79,
                  height: 79,
                ),
                const SizedBox(height: 10),
                Text(
                  '100K+ Premium Recipe',
                  style:
                      TextStyles.mediumTextBold.copyWith(color: Colors.white),
                ),
                const Spacer(),
                const Text(
                  'Get',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  'Cooking',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Simple way to find Tasty Recipe',
                  style: TextStyles.normalTextRegular.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 50),
                const MediumButton(text: 'Start Cooking'),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

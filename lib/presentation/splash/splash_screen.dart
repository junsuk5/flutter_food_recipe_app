import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/component/medium_button.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatelessWidget {
  final void Function()? onStartCookingTap;

  const SplashScreen({
    super.key,
    this.onStartCookingTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/splash_image.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
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
                  AppLocalizations.of(context)!.description,
                  style: TextStyles.normalTextRegular.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 50),
                MediumButton(
                  text: 'Start Cooking',
                  onPressed: () => onStartCookingTap?.call(),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/components/big_button.dart';
import 'package:food_recipe_app/presentation/components/custom_text_field.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 90),
                const Text(
                  'Hello',
                  style: TextStyles.headerTextBold,
                ),
                const Text(
                  'Welcome Back!',
                  style: TextStyles.largeTextRegular,
                ),
                const SizedBox(height: 90),
                const CustomTextField(
                  title: 'Email',
                  placeHolderText: 'Enter Email',
                ),
                const SizedBox(height: 30),
                const CustomTextField(
                  title: 'Enter Password',
                  placeHolderText: 'Enter Password',
                ),
                const SizedBox(height: 30),
                Text(
                  'Forgot Password?',
                  style: TextStyles.smallTextRegular
                      .copyWith(color: ColorStyles.secondaryColor),
                ),
                const SizedBox(height: 30),
                const BigButton(text: 'Sign In'),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 50, height: 1, color: ColorStyles.gray4),
                    const SizedBox(width: 10),
                    const Text(
                      'Or Sign in With',
                      style: TextStyle(color: ColorStyles.gray4),
                    ),
                    const SizedBox(width: 10),
                    Container(width: 50, height: 1, color: ColorStyles.gray4),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/Google.png'),
                    Image.asset('assets/Facebook.png'),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don’t have an account? ',
                      style: TextStyles.smallTextSemiBold,
                    ),
                    Text(
                      'Sign up',
                      style: TextStyles.smallTextSemiBold.copyWith(
                        color: ColorStyles.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

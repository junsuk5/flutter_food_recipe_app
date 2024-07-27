import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/presentation/component/big_button.dart';
import 'package:food_recipe_app/core/presentation/component/custom_checkbox.dart';
import 'package:food_recipe_app/core/presentation/component/custom_text_field.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Create an account',
                    style: TextStyles.largeTextBold),
                const Text(
                  'Let’s help you set up your account,',
                  style: TextStyles.smallTextRegular,
                ),
                const Text(
                  ' it won’t take long.',
                  style: TextStyles.smallTextRegular,
                ),
                const SizedBox(height: 30),
                const CustomTextField(
                  title: 'Name',
                  placeHolderText: 'Enter Name',
                ),
                const SizedBox(height: 30),
                const CustomTextField(
                  title: 'Email',
                  placeHolderText: 'Enter Email',
                ),
                const SizedBox(height: 30),
                const CustomTextField(
                  title: 'Password',
                  placeHolderText: 'Enter Password',
                ),
                const SizedBox(height: 30),
                const CustomTextField(
                  title: 'Confirm Password',
                  placeHolderText: 'Retype Password',
                ),
                const SizedBox(height: 10),
                CustomCheckbox(
                  label: 'Accept terms & Condition',
                  value: false,
                  onChanged: (value) {},
                ),
                const SizedBox(height: 10),
                const BigButton(text: 'Sign Up'),
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
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already a member? ',
                      style: TextStyles.smallTextBold,
                    ),
                    GestureDetector(
                      onTap: () => {},
                      child: Text(
                        'Sign in',
                        style: TextStyles.smallTextBold.copyWith(
                          color: ColorStyles.secondaryColor,
                        ),
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

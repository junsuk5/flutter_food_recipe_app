import 'package:food_recipe_app/auth/presentation/create_account/create_account_screen.dart';
import 'package:food_recipe_app/auth/presentation/sing_in/sign_in_screen.dart';
import 'package:food_recipe_app/auth/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(
        onStartCookingTap: () => context.go('/sign_in'),
      ),
    ),
    GoRoute(
      path: '/sign_in',
      builder: (context, state) => SignInScreen(
        onSignupTap: () {
          context.push('/create_account');
        },
      ),
    ),
    GoRoute(
      path: '/create_account',
      builder: (context, state) => const CreateAccountScreen(),
    ),
  ],
);

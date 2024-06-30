import 'package:food_recipe_app/presentation/auth/sign_in_screen.dart';
import 'package:food_recipe_app/presentation/auth/splash_screen.dart';
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
      builder: (context, state) => const SignInScreen(),
    ),
  ],
);

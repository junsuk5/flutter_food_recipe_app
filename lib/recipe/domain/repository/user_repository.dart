import 'package:food_recipe_app/recipe/domain/model/user.dart';

abstract interface class UserRepository {
  Future<User?> getUser();
}

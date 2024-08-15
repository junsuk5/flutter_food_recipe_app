import 'package:food_recipe_app/domain/model/user.dart';

abstract interface class UserRepository {
  Future<User?> getUser();
}

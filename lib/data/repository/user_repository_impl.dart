import 'package:food_recipe_app/domain/model/user.dart';
import 'package:food_recipe_app/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final User _user = const User(
      id: 1,
      name: 'StrangeCoder',
      email: 'dh90502@gmail.com',
      image:
          'https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png');

  @override
  Future<User> getUser() async {
    return _user;
  }
}

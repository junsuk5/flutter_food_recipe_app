import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/recipe/domain/model/user.dart';
import 'package:food_recipe_app/recipe/domain/repository/user_repository.dart';

class GetUserUseCase {
  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);

  Future<Result<User>> execute() async {
    try {
      final user = await _userRepository.getUser();

      if (user == null) {
        return const Result.error('유저 정보가 없습니다');
      }

      return Result.success(user);
    } catch (e) {
      return const Result.error('알 수 없는 이유로 유저 정보 로드에 실패했습니다');
    }
  }
}

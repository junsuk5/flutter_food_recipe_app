import 'package:food_recipe_app/domain/model/profile.dart';
import 'package:food_recipe_app/core/util/result.dart';
import 'package:food_recipe_app/data/data_source/remote/profile/profile_data_source.dart';
import 'package:food_recipe_app/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource dataSource;

  const ProfileRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Result<List<Profile>>> getProfiles() async {
    try {
      final result = await dataSource.getProfiles();
      return Result.success(result);
    } catch (e) {
      return const Result.error('로드에 실패했습니다.');
    }
  }
}

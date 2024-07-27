import 'package:food_recipe_app/core/domain/model/profile.dart';
import 'package:food_recipe_app/core/result.dart';

abstract interface class ProfileRepository {
  Future<Result<List<Profile>>> getProfiles();
}

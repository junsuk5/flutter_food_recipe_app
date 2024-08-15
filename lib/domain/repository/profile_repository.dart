import 'package:food_recipe_app/domain/model/profile.dart';
import 'package:food_recipe_app/core/util/result.dart';

abstract interface class ProfileRepository {
  Future<Result<List<Profile>>> getProfiles();
}

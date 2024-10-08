import 'package:food_recipe_app/core/util/result.dart';
import 'package:food_recipe_app/domain/model/procedure.dart';

abstract interface class ProcedureRepository {
  Future<Result<List<Procedure>> > getProcedures();
}

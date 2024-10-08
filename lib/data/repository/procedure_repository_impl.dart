import 'package:food_recipe_app/core/util/result.dart';
import 'package:food_recipe_app/data/data_source/remote/procedure/procedure_data_source.dart';
import 'package:food_recipe_app/domain/model/procedure.dart';
import 'package:food_recipe_app/domain/repository/procedure_repository.dart';

class ProcedureRepositoryImpl implements ProcedureRepository {
  final ProcedureDataSource dataSource;

  const ProcedureRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Result<List<Procedure>>> getProcedures() async {
    try {
      final result = await dataSource.getProcedures();
      return Result.success(result);
    } catch (e) {
      return const Result.error('로드에 실패했습니다.');
    }
  }
}

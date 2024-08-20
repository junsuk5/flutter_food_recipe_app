import 'package:food_recipe_app/data/data_source/local/bookmark_data_source.dart';
import 'package:food_recipe_app/domain/repository/bookmark_repository.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final BookmarkDataSource _recipeDataSource;

  BookmarkRepositoryImpl(this._recipeDataSource);

  @override
  Future<void> save(int id) async {
    await _recipeDataSource.addBookmark(id);
  }

  @override
  Future<void> unSave(int id) async {
    await _recipeDataSource.removeBookmark(id);
  }

  @override
  Future<List<int>> getBookmarkedRecipeIds() async {
    return _recipeDataSource.getBookmarkedRecipeIds();
  }
}

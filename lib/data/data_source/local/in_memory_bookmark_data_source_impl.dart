import 'package:food_recipe_app/data/data_source/local/bookmark_data_source.dart';

class InMemoryBookmarkDataSourceImpl implements BookmarkDataSource {
  final Set<int> _bookmarks = {2, 4};

  @override
  Future<bool> addBookmark(int recipeId) async {
    return _bookmarks.add(recipeId);
  }

  @override
  Future<List<int>> getBookmarkedRecipeIds() async {
    return _bookmarks.toList();
  }

  @override
  Future<bool> isBookmarked(int recipeId) async {
    return _bookmarks.contains(recipeId);
  }

  @override
  Future<bool> updateBookmark(int recipeId, Map<String, dynamic> data) async {
    if (_bookmarks.contains(recipeId)) {
      // TODO : 현재는 특별한 업데이트 로직이 없지만, 필요한 경우 여기서 구현
      return true;
    }
    return false;
  }

  @override
  Future<bool> removeBookmark(int recipeId) async {
    return _bookmarks.remove(recipeId);
  }

  @override
  Future<int> getBookmarkCount() async {
    return _bookmarks.length;
  }

  @override
  Future<void> clearAllBookmarks() async {
    _bookmarks.clear();
  }
}

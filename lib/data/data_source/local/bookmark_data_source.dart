abstract interface class BookmarkDataSource {
  // Create
  Future<bool> addBookmark(int recipeId);

  // Read
  Future<List<int>> getBookmarkedRecipeIds();

  Future<bool> isBookmarked(int recipeId);

  // Update (필요한 경우)
  Future<bool> updateBookmark(int recipeId, Map<String, dynamic> data);

  // Delete
  Future<bool> removeBookmark(int recipeId);

  // 추가 유틸리티 메서드
  Future<int> getBookmarkCount();

  Future<void> clearAllBookmarks();
}

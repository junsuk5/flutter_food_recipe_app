abstract interface class BookmarkRepository {
  Future<void> save(int id);

  Future<void> unSave(int id);

  Future<List<int>> getBookmarkedRecipeIds();
}

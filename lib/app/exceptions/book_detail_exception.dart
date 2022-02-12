class BookDetailException implements Exception {
  final String message;

  const BookDetailException(this.message);

  @override
  String toString() {
    return message;
  }
}

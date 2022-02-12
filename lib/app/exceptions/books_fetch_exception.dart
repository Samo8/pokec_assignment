class BooksFetchException implements Exception {
  final String message;

  const BooksFetchException(this.message);

  @override
  String toString() {
    return message;
  }
}

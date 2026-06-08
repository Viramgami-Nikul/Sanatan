/// Iterable extension to extend iterable functionality
extension MyIterable<T> on Iterable<T> {
  /// Returns first element or null
  T? get firstOrNull =>
      isEmpty ? null : first;

  /// Returns first matched element or null
  T? firstWhereOrNull(
      bool Function(T element) test,
      ) {
    final Iterable<T> list =
    where(test);

    return list.isEmpty
        ? null
        : list.first;
  }
}

/// List extension
extension ListExt on List? {
  /// Check list is null or empty
  bool isNullOrEmpty() {
    if (this != null) {
      return this!.isEmpty;
    }

    return true;
  }

  /// Check list contains data
  bool isNotNullOrEmpty() {
    return !isNullOrEmpty();
  }


  String get itemCountText {
    final int count =
        this?.length ?? 0;

    if (count <= 1) {
      return '$count Service';
    }

    return '$count Services';
  }
}

class PaginationModel {
  final int currentPage;

  final int lastPage;

  final int total;

  final int perPage;

  PaginationModel({
    required this.currentPage,
    required this.lastPage,
    required this.total,
    required this.perPage,
  });

  factory PaginationModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return PaginationModel(
      currentPage:
      json['current_page'] ?? 1,

      lastPage:
      json['last_page'] ?? 1,

      total:
      json['total'] ?? 0,

      perPage:
      json['per_page'] ?? 10,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'last_page': lastPage,
      'total': total,
      'per_page': perPage,
    };
  }
}

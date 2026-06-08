class DropdownModel {
  final dynamic id;

  final String title;

  DropdownModel({
    required this.id,
    required this.title,
  });

  factory DropdownModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return DropdownModel(
      id: json['id'],
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }

  @override
  String toString() {
    return title;
  }
}

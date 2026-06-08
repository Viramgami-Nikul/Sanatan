class ErrorModel {
  final int? statusCode;

  final String? message;

  final dynamic errors;

  ErrorModel({
    this.statusCode,
    this.message,
    this.errors,
  });

  factory ErrorModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return ErrorModel(
      statusCode:
      json['status_code'],

      message:
      json['message'],

      errors:
      json['errors'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status_code': statusCode,
      'message': message,
      'errors': errors,
    };
  }

  @override
  String toString() {
    return message ?? 'Unknown Error';
  }
}

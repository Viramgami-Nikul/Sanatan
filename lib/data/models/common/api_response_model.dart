class ApiResponseModel<T> {
  final bool success;

  final String message;

  final T? data;

  final dynamic errors;

  ApiResponseModel({
    required this.success,
    required this.message,
    this.data,
    this.errors,
  });

  factory ApiResponseModel.fromJson(
      Map<String, dynamic> json, {
        T Function(dynamic json)? fromJsonT,
      }) {
    return ApiResponseModel<T>(
      success: json['success'] ?? false,

      message: json['message'] ?? '',

      data:
      fromJsonT != null && json['data'] != null
          ? fromJsonT(json['data'])
          : json['data'],

      errors: json['errors'],
    );
  }

  Map<String, dynamic> toJson({
    dynamic Function(T value)? toJsonT,
  }) {
    return {
      'success': success,
      'message': message,
      'data':
      toJsonT != null && data != null
          ? toJsonT(data as T)
          : data,
      'errors': errors,
    };
  }
}

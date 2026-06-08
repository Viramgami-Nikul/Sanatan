// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(final DioException dioError) {
    switch (dioError.type) {

      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
        break;

      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;

      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;

      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;

      case DioExceptionType.connectionError:
        message = 'No internet connection';
        break;

      case DioExceptionType.badResponse:
        error = error;
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.statusMessage,
        );
        break;

      case DioExceptionType.unknown:

        if ((dioError.message ?? '').contains('SocketException')) {
          message = 'No Internet';
          break;
        }

        if ((dioError.message ?? '').contains('HandshakeException')) {
          message = 'Response data not found';
          break;
        }

        message = 'Unexpected error occurred';
        break;

      default:
        message = 'Something went wrong';
        break;
    }
  }

  String message = '';
  String? error;

  String _handleError(
      final int? statusCode,
      final String? error,
      ) {

    switch (statusCode) {

      case 400:
        return error ?? 'Bad request';

      case 401:
        return error ?? 'Unauthorized';

      case 403:
        return error ?? 'Forbidden';

      case 404:
        return error ?? 'Not Found';

      case 420:
        return 'Session Expired. Please login again';

      case 500:
        return error ?? 'Internal server error';

      case 502:
        return error ?? 'Server unavailable';

      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}

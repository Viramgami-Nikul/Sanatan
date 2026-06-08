import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:santvani_app/utils/connection.dart';
import 'package:santvani_app/components/common_snack_bar.dart';
import 'package:santvani_app/data/api/dio_exception.dart';
import 'package:santvani_app/helper/pref_helper/shared_pref_helper.dart';
import 'package:santvani_app/utils/app_enums.dart';

class DioInterceptor extends InterceptorsWrapper {

  DioInterceptor({
    super.onRequest,
    super.onResponse,
    super.onError,
  });

  @override
  void onRequest(
      final RequestOptions options,
      final RequestInterceptorHandler handler,
      ) async {

    /// Check Internet Connection
    if (!await ConnectionUtils.isNetworkConnected()) {

      showErrorSnackBar(
        AppMessages.networkError.message,
      );

      handler.reject(
        DioException(
          requestOptions: options,
          error: null,
          message: AppMessages.networkError.message,
          type: DioExceptionType.connectionError,
        ),
      );

      return;
    }

    /// Headers
    final Map<String, dynamic> header = <String, dynamic>{

      'Content-Type': 'application/json',

    };

    /// Authorization Token
    if ((SharedPreferenceHelper().user?.authToken ?? '').isNotEmpty) {

      header['Authorization'] =
      'Bearer ${SharedPreferenceHelper().user?.authToken}';
    }

    /// Language Header
    // if (SharedPreferenceHelper().getLanguageCode.isNotEmpty) {
    //   header['Accept-Language'] =
    //       SharedPreferenceHelper().getLanguageCode;
    // }

    debugPrint('HEADER => $header');

    options.headers = header;

    super.onRequest(options, handler);
  }

  @override
  void onResponse(
      final Response<dynamic> response,
      final ResponseInterceptorHandler handler,
      ) {

    super.onResponse(response, handler);
  }

  @override
  void onError(
      final DioException err,
      final ErrorInterceptorHandler handler,
      ) {

    String message = '';

    /// Handle API Error Response
    if (err.response?.data is Map) {

      final errors = err.response?.data['errors'];

      if (errors != null) {

        if (errors is Map) {

          final values = errors.entries.first.value;

          if (values is List) {

            message = values.first;
          }
        }
      }

      /// Main Message
      if (err.response?.data['message'] != null) {

        message = err.response?.data['message'];
      }
    }

    /// Show Snackbar
    if (message.isNotEmpty) {

      showErrorSnackBar(message);

    } else {

      final String msg =
          DioExceptions.fromDioError(err).message;

      showErrorSnackBar(msg);
    }

    super.onError(err, handler);
  }
}

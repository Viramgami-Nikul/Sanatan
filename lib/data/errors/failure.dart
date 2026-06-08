import 'package:equatable/equatable.dart';
import 'package:santvani_app/utils/app_strings.dart';

abstract class Failure extends Equatable {

  const Failure({
    this.message,
    this.statusCode,
  });

  final String? message;
  final int? statusCode;

  @override
  List<Object?> get props => [
    message,
    statusCode,
  ];
}

class ApiFailure extends Failure {

  const ApiFailure({
    super.message = AppStrings.globalErrorMessage,
    super.statusCode = -1,
  });
}

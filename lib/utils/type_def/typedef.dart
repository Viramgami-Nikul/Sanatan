import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';

/// =====================================================
/// Common Result Types
/// =====================================================

/// Future result with Either<Failure, T>
typedef ResultFuture<T> = Future<Either<Failure, T>>;

/// Future result without data
typedef ResultFutureVoid = ResultFuture<void>;

/// Future result with nullable data
typedef ResultFutureNullable<T> = Future<Either<Failure, T?>>;

/// Non-future result
typedef Result<T> = Either<Failure, T>;

/// API JSON response
typedef Json = Map<String, dynamic>;

/// Generic list JSON response
typedef JsonList = List<Map<String, dynamic>>;

/// Generic callback
typedef VoidCallbackFunc = void Function();

/// Generic value changed callback
typedef ValueChangedCallback<T> = void Function(T value);

/// Async callback
typedef AsyncCallback = Future<void> Function();

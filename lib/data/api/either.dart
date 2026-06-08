abstract class Either<L, R> {
  const Either();

  T fold<T>(
      final T Function(L l) leftFn,
      final T Function(R r) rightFn,
      );

  bool get isLeft => this is Left<L, R>;

  bool get isRight => this is Right<L, R>;
}

class Left<L, R> extends Either<L, R> {

  final L value;

  const Left(this.value);

  @override
  T fold<T>(
      final T Function(L l) leftFn,
      final T Function(R r) rightFn,
      ) {
    return leftFn(value);
  }
}

class Right<L, R> extends Either<L, R> {

  final R value;

  const Right(this.value);

  @override
  T fold<T>(
      final T Function(L l) leftFn,
      final T Function(R r) rightFn,
      ) {
    return rightFn(value);
  }
}

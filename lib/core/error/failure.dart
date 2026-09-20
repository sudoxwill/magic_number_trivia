sealed class Failure {
  final String? message;

  Failure([this.message]);
}

class NetworkFailure extends Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class NotFoundFailure extends Failure {}

class FormatFailure extends Failure {}

class UnexpectedFailure extends Failure {}

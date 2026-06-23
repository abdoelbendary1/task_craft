import 'package:equatable/equatable.dart';

/// Base class for all application failures.
/// Extending [Equatable] ensures value equality rather than reference equality.
sealed class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure(this.message, {this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

/// Represents server-side errors (e.g., 500 Internal Server Error, 404 Not Found).
class ServerFailure extends Failure {
  const ServerFailure({
    String message = 'A server error occurred. Please try again later.',
    int? statusCode,
  }) : super(message, statusCode: statusCode);
}

/// Represents network connectivity issues (e.g., no internet, timeout).
class NetworkFailure extends Failure {
  const NetworkFailure({
    String message = 'No internet connection. Please check your network.',
  }) : super(message);
}

/// Represents caching failures (e.g., local database errors, secure storage failures).
class CacheFailure extends Failure {
  const CacheFailure({String message = 'Failed to read or write local data.'})
    : super(message);
}

/// Represents validation or input errors (e.g., invalid email format, weak password).
class ValidationFailure extends Failure {
  const ValidationFailure({required String message}) : super(message);
}

/// A generic failure for unexpected or unhandled exceptions.
class UnknownFailure extends Failure {
  const UnknownFailure({String message = 'An unexpected error occurred.'})
    : super(message);
}

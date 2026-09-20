sealed class CustomException implements Exception {
  final String? message;

  CustomException([this.message]);
}

class NetworkException extends CustomException {}

class ServerException extends CustomException {}

class CacheException extends CustomException {}

class NotFoundException extends CustomException {}

class BadRequestException implements Exception {
  final Map<String, dynamic> errors;

  BadRequestException(this.errors);
}

class ResourceNotFoundException implements Exception {
  final String message;

  ResourceNotFoundException(this.message);
}

class UnauthorizedException implements Exception {
  final String message;

  UnauthorizedException(this.message);
}

class ForbiddenException implements Exception {
  final String message;

  ForbiddenException(this.message);
}

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);
}

class InternalServerErrorException implements Exception {
  final String message;

  InternalServerErrorException(this.message);
}

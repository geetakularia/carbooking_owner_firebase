class AppExceptions implements Exception {
  final String? message;
  final String? prefix;
  AppExceptions([this.message, this.prefix]);
  @override
  String toString() {
    return "$prefix :: $message";
  }
}


//  AUTH EXCEPTION
class AuthException extends AppExceptions {
  AuthException([msg]) : super(msg, "UnAuthorized Access!");
}

//  SOCKET EXCEPTION
class Socketexception extends AppExceptions {
  Socketexception([msg]) : super(msg, "No Internet!");
}

//  TIME OUT EXCEPTION
class Timeoutexception extends AppExceptions {
  Timeoutexception([msg]) : super(msg, "Timeout Exception!");
}

//  BAD REQUEST EXCEPTION
class BadRequestException extends AppExceptions {
  BadRequestException(msg) : super(msg, "Invalid request");
}

//  FETCH DATA EXCEPTION
class FetchDataException extends AppExceptions {
  FetchDataException(msg) : super(msg, "Error During Communication");
}

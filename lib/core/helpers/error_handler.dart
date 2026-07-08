import 'dart:async';

class ErrorHandler {
  static String getMessage(Object error) {
    if (error is TimeoutException) {
      return "Unable to connect to the server.\nPlease try again later.";
    }

    return error.toString().replaceFirst("Exception: ", "");
  }
}

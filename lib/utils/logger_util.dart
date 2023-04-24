import 'dart:developer';

void logger(String message) {
  bool _debug = true;

  if (_debug) {
    if (message != null || message != '') {
      log(message.toString());
    }
  }
}
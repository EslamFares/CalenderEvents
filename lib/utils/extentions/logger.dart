import 'dart:developer';

class Logger {
  static const String _reset = '\x1B[0m';
  static const String _red = '\x1B[31m';
  static const String _redBGWhite = '\x1b[37;41m';
  static const String _grayBGWhite = '\x1b[37;40m';
  static const String _greenBGWhite = '\x1b[37;42m';
  static const String _blue = '\x1B[34m';
  static const String _yellow = '\x1B[33m';
  static const String _white = '\x1B[37m';
  static const String _green = '\x1B[32m';
  // static const String _yellowBGWhite = '\x1b[37;43m';
  // static const String _magenta = '\x1B[35m';
  // static const String _whiteBGBlack = '\x1b[30;47m';
  Logger(String message, {String? title}) {
    logger(message);
  }
  static void error(String message, {String? title}) {
    log('$_red[${title ?? "ERROR"}]: $message$_reset');
  }

  static void risk(String message, {String? title}) {
    log('$_redBGWhite[${title ?? "Risk"}]: $message$_reset');
  }

  static void logger(String message, {String? title}) {
    log('$_greenBGWhite[${title ?? "logger"}]: $message$_reset');
  }

  static void grey(String message, {String? title}) {
    log('$_grayBGWhite[${title ?? "logger"}]: $message$_reset');
  }

  static void normal(String message, {String? title}) {
    log('$_blue[${title ?? "NORMAL"}]: $message$_reset');
  }

  static void warning(String message, {String? title}) {
    log('$_yellow[${title ?? "WARNING"}]: $message$_reset');
  }

  static void info(String message, {String? title}) {
    log('$_white[${title ?? "INFO"}]: $message$_reset');
  }

  static void green(String message, {String? title}) {
    log('$_green[${title ?? "Logger"}]: $message$_reset');
  }

  // static void magenta(String message) {
  //   log('$_magenta[Magenta]: $message$_reset');
  // }

  // static void whiteBlack(String message) {
  //   log('$_whiteBGBlack[Magenta]: $message$_reset');
  // }
}
//! use : Logger.error('This is an error message.');

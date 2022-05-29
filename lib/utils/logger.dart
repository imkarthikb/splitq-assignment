import 'package:flutter/foundation.dart';

class Logger {
  static log(Object? value, {String tag = 'SplitqApp'}) {
    if (kDebugMode) {
      print('$tag: $value');
    }
  }
}

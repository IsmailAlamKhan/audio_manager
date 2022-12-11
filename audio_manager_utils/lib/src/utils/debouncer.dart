// 🎯 Dart imports:
import 'dart:async';

class Debouncer {
  final int milliseconds;
  FutureOr Function()? action;
  Timer? _timer;
  Debouncer({required this.milliseconds});
  FutureOr run(FutureOr Function() action) {
    this.action ??= action;
    final completer = Completer<void>();
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), () async {
      await action();
      completer.complete();
    });
    return completer.future;
  }

  FutureOr runInstant(FutureOr Function() action) {
    this.action ??= action;
    if (_timer != null) {
      _timer!.cancel();
    }
    return action();
  }
}

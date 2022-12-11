import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'env.dart';

part 'env_controller.g.dart';

@Riverpod(keepAlive: true)
class EnvController extends _$EnvController {
  void setIp(String ip) {
    state.ip = ip;
    ref.notifyListeners();
  }

  String get ip => state.ip;

  @override
  Env build() => Env();
}

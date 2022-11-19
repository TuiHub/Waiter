import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'config.freezed.dart';

@freezed
class GlobalConfig with _$GlobalConfig {
  const factory GlobalConfig({
    required String host,
    required String port,
    required String username,
    required String password,
  }) = _GlobalConfig;

  factory GlobalConfig.fromJson(Map<String, Object?> json) =>
      _$GlobalConfigFromJson(json);
}

class GlobalConfigNotifier extends StateNotifier<GlobalConfig> {
  GlobalConfigNotifier()
      : super(
          const GlobalConfig(host: "", port: "", username: "", password: ""),
        );

  Future<void> recover() async {
    final prefs = await SharedPreferences.getInstance();
    final String? config = prefs.getString('config');
    state = GlobalConfig.fromJson(jsonDecode(config!) as Map<String, Object?>);
  }

  Future<void> save(GlobalConfig c) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('config', jsonEncode(c.toJson()));
    state = c;
  }
}

final globalConfigProvider =
    StateNotifierProvider<GlobalConfigNotifier, GlobalConfig>((ref) {
  final g = GlobalConfigNotifier();
  g.recover();
  return g;
});

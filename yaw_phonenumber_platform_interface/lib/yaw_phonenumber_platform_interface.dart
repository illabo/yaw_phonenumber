import 'dart:async';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel_yaw_phonenumber.dart';

abstract class YawPhonenumberPlatform extends PlatformInterface {
  YawPhonenumberPlatform() : super(token: _token);
  static final _token = Object();
  static YawPhonenumberPlatform _instance = MethodChannelYawPhonenumber();
  static YawPhonenumberPlatform get instance => _instance;
  static set instance(YawPhonenumberPlatform impl) {
    PlatformInterface.verifyToken(impl, _token);
    _instance = impl;
  }

  Future<String> formatIncomplete(String string) async {
    throw UnimplementedError(
        'formatIncomplete unimplemented for this platform');
  }

  Future<String> formatAsInternational(String string) async {
    throw UnimplementedError(
        'formatAsInternational unimplemented for this platform');
  }

  Future<bool> isValidNumber(String string) async {
    throw UnimplementedError('isValidNumber unimplemented for this platform');
  }

  Future<bool> isInternationallyDialable(String string) async {
    throw UnimplementedError(
        'isInternationallyDialable unimplemented for this platform');
  }
}

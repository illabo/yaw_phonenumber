import 'package:flutter/services.dart';
import 'yaw_phonenumber_platform_interface.dart';

class MethodChannelYawPhonenumber extends YawPhonenumberPlatform {
  static const MethodChannel _channel = const MethodChannel('yaw_phonenumber');

  static Future<String> formatIncomplete(String string) async {
    return await _channel
        .invokeMethod('formatIncomplete', <String, dynamic>{"phone": string});
  }

  static Future<String> formatAsInternational(String string) async {
    return await _channel.invokeMethod(
        'formatAsInternational', <String, dynamic>{"phone": string});
  }

  static Future<bool> isValidNumber(String string) async {
    return await _channel
        .invokeMethod('isValidNumber', <String, dynamic>{"phone": string});
  }

  static Future<bool> isInternationallyDialable(String string) async {
    return await _channel.invokeMethod(
        'isInternationallyDialable', <String, dynamic>{"phone": string});
  }
}

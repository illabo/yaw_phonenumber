import 'dart:async';

import 'package:yaw_phonenumber_platform_interface/yaw_phonenumber_platform_interface.dart';

final YawPhonenumberPlatform instance = YawPhonenumberPlatform.instance;

Future<String> formatIncomplete(String string) async {
  return await instance.formatIncomplete(string);
}

Future<String> formatAsInternational(String string) async {
  return await instance.formatAsInternational(string);
}

Future<bool> isValidNumber(String string) async {
  return await instance.isValidNumber(string);
}

Future<bool> isInternationallyDialable(String string) async {
  return await instance.isInternationallyDialable(string);
}

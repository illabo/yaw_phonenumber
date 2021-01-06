import 'dart:async';
import 'dart:html' as html show window;
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:yaw_phonenumber_platform_interface/yaw_phonenumber_platform_interface.dart';
import 'package:yaw_phonenumber_web/src/libphonenumber_js_wrapper.dart';
import 'package:yaw_phonenumber_web/src/likely_combinations.dart';

/// A web implementation of the YawPhonenumberWeb plugin.
class YawPhonenumberWeb extends YawPhonenumberPlatform {
  final _region = () {
    final parts = html.window.navigator.languages.first
            ?.replaceAll('_', '-')
            ?.split("-") ??
        [];
    if (parts.length > 2 && LikelyCountry.isKnown(parts[2])) return parts[2];
    if (parts.length == 2 && LikelyCountry.isKnown(parts[1])) return parts[1];
    if (parts.isNotEmpty) return LikelyCountry.forCode(parts[0]);
    return 'US';
  }();

  static void registerWith(Registrar registrar) {
    YawPhonenumberPlatform.instance = YawPhonenumberWeb();
  }

  @override
  Future<String> formatIncomplete(String string) async {
    return formatIncompletePhoneNumber(string, _region);
  }

  @override
  Future<String> formatAsInternational(String string) async {
    final pn = parsePhoneNumber(string);
    return pn.formatInternational();
  }

  @override
  Future<bool> isValidNumber(String string) async {
    final pn = parsePhoneNumber(string);
    return pn.isValid();
  }

  @override
  Future<bool> isInternationallyDialable(String string) async {
    final pn = parsePhoneNumber(string);
    try {
      return pn.formatInternational().isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}

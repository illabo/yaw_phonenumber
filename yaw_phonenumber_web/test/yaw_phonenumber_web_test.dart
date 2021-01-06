import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yaw_phonenumber_web/yaw_phonenumber_web.dart';

void main() {
  const MethodChannel channel = MethodChannel('yaw_phonenumber_web');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await YawPhonenumberWeb().isValidNumber('+7 914 324-31-78'), true);
  });
}

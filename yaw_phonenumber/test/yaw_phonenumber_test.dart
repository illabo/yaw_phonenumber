import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yaw_phonenumber/yaw_phonenumber.dart';

void main() {
  const MethodChannel channel = MethodChannel('yaw_phonenumber');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  // test('getPlatformVersion', () async {
  //   expect(await YawPhonenumber.platformVersion, '42');
  // });
}

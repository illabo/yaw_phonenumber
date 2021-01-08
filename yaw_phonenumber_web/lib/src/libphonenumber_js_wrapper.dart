@JS('libphonenumber')
library libphonenumber;

import 'package:js/js.dart';

@JS('formatIncompletePhoneNumber')
external String formatIncompletePhoneNumber(String number, String region);

@JS('parsePhoneNumber')
external PhoneNumber parsePhoneNumber(String number, String region);

@JS('PhoneNumber')
class PhoneNumber {
  @JS('formatInternational')
  external String formatInternational();

  @JS('isValid')
  external bool isValid();
}

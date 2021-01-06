@JS()
library libphonenumber;

import 'package:js/js.dart';

@JS('formatIncompletePhoneNumber')
external String formatIncompletePhoneNumber(String number, String countryCode);

@JS('parsePhoneNumber')
external PhoneNumber parsePhoneNumber(String number);

@JS('PhoneNumber')
class PhoneNumber {
  @JS('formatInternational')
  external String formatInternational();

  @JS('isValid')
  external bool isValid();
}

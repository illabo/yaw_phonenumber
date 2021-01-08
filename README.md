## Yet another wrapper for libphonenumber
It is yet another wrapper to be used with Flutter projects to format and validate phone numbers.
It only provides a scarse subset of available methods from original libraries it wraps around. Currently there are such methods:
```dart
formatIncomplete('+799988');                //  +7 999 88
formatAsInternational('+79998887766');      //  +7 999 888 77 66
isValidNumber('+79998887766');              //  true
isInternationallyDialable('+79998887766');  //  true
```
_* please note that number is  made up for example purpose only and doesn't ment to be a real number._

For now there are only Android and JS versions wrapped with this library.

### How to use
This library is immature to be published on pub.dev and may be added to `pubspec.yml` from GitHib directly.
```yaml
  yaw_phonenumber_platform_interface:
    git:
      url: https://github.com/illabo/yaw_phonenumber.git
      path: yaw_phonenumber_platform_interface
  yaw_phonenumber_web:
    git:
      url: https://github.com/illabo/yaw_phonenumber.git
      path: yaw_phonenumber_web
```
To be able to use it on web please add something like this to your project's `index.html`:
```html
<script src="https://unpkg.com/libphonenumber-js@1.7.6/bundle/libphonenumber-min.js" />
```
The actual script to use you can choose according to original script author's documentation as may be found here: https://gitlab.com/catamphetamine/libphonenumber-js

### Underlying libraries
The libraries used aren't the [Google's libphonenumber](https://github.com/google/libphonenumber) but rather Google acknowliged ports known for some improvements for an end user of a library. E.g. [libphonenumber-js](https://gitlab.com/catamphetamine/libphonenumber-js) utilized here is in its minimal version is just ~80 kb (Google's full metadata is almost 10x bigger), doesn't require recompiling and is served from cdn. And [libphonenumber-android](https://github.com/MichaelRocks/libphonenumber-android) is simply works faster then Google's implementation on Android devices and also is nicely repacked for easy importing.

### Further developement
This library is planned to only be extended accrding to my very own needs. Currently it meets my minimal requirements. However I don't mind if any PRs would be made and would happily accept it.
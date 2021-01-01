import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:yaw_phonenumber/yaw_phonenumber.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _formattedNumber = '';
  bool _isValid = false;
  bool _isIntDial = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    _setStateForPhone(value);
                  },
                ),
                Text(_formattedNumber),
                Row(
                  children: [
                    _isValid
                        ? Icon(
                            CupertinoIcons.check_mark,
                            color: Colors.green,
                          )
                        : Icon(
                            CupertinoIcons.nosign,
                            color: Colors.red,
                          ),
                    _isValid ? Text("Is valid") : Text("Not valid"),
                  ],
                ),
                Row(
                  children: [
                    _isIntDial
                        ? Icon(
                            CupertinoIcons.check_mark,
                            color: Colors.green,
                          )
                        : Icon(
                            CupertinoIcons.nosign,
                            color: Colors.red,
                          ),
                    _isIntDial
                        ? Text("Is international")
                        : Text("Not international"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _setStateForPhone(String phone) async {
    await _getFormattedNumber(phone);
    await _isValidNumber(phone);
    await _isIntlDialable(phone);
    setState(() {});
  }

  Future<void> _getFormattedNumber(String phone) async {
    _formattedNumber = await formatIncomplete(phone);
  }

  Future<void> _isValidNumber(String phone) async {
    _isValid = await isValidNumber(phone);
  }

  Future<void> _isIntlDialable(String phone) async {
    _isIntDial = await isInternationallyDialable(phone);
  }
}

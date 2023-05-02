import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// https://docs.flutter.dev/platform-integration/platform-channels
class MyMethodChannel extends StatefulWidget {
  const MyMethodChannel({Key? key}) : super(key: key);

  @override
  State<MyMethodChannel> createState() => _MyMethodChannelState();
}

class _MyMethodChannelState extends State<MyMethodChannel> {
  static const platform = const MethodChannel('momong.com/value');

  String _value = 'null';

  Future<void> _getNativeValue() async {
    String value;
    try {
      value = await platform.invokeMethod('getValue');
      setState(() {
        _value = value;
      });
    } on PlatformException catch(e) {
      _value = '네이티브 코드 실행 에러 ${e.message}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MethodChannel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_value),
            ElevatedButton(
              onPressed: () {
                _getNativeValue();
              },
              child: Text('네이티드값 얻기'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MySnackBar extends StatefulWidget {
  const MySnackBar({Key? key}) : super(key: key);

  @override
  State<MySnackBar> createState() => _MySnackBarState();
}

class _MySnackBarState extends State<MySnackBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar'),
      ),
      body: Builder(
          builder: (context) => Center(
                child: ElevatedButton(
                  onPressed: () {
                    const snackBar = SnackBar(
                      content: Text('스낵바'),
                    );

                    // https://docs.flutter.dev/release/breaking-changes/scaffold-messenger
                    // Scaffold.of(context).showSnackBar(snackBar); // ScaffoldMessenger로 변경
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Text('Show SnackBar'),
                ),
              )),
    );
  }
}

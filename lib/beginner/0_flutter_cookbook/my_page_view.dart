import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({Key? key}) : super(key: key);

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.blue,
        ),
      ],

    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_momong_project/beginner/0_flutter_cookbook/my_animated_opacity.dart';
import 'package:flutter_momong_project/beginner/0_flutter_cookbook/my_drawer.dart';
import 'package:flutter_momong_project/beginner/0_flutter_cookbook/my_form_validation.dart';
import 'package:flutter_momong_project/beginner/0_flutter_cookbook/my_orientation.dart';
import 'package:flutter_momong_project/beginner/0_flutter_cookbook/my_page_view.dart';
import 'package:flutter_momong_project/beginner/0_flutter_cookbook/my_snack_bar.dart';
import 'package:flutter_momong_project/beginner/0_flutter_cookbook/my_tap_controller.dart';

import 'beginner/0_flutter_cookbook/my_animated_container.dart';
import 'beginner/0_flutter_cookbook/my_method_channel.dart';
import 'beginner/0_flutter_cookbook/my_swipe_to_dismiss.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Tutorial'),
        ),
        body: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const ListTile(
          title: Text(
            '섹션0.Flutter Cookbook',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          title: const Text('AnimatedContainer'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyAnimatedContainer()));
          },
        ),
        ListTile(
          title: const Text('AnimatedOpacity'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyAnimatedOpacity()));
          },
        ),
        ListTile(
          title: const Text('Drawer'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyDrawer()));
          },
        ),
        ListTile(
          title: const Text('SnackBar'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MySnackBar()));
          },
        ),
        ListTile(
          title: const Text('Orientation 화면 전환'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyOrientation()));
          },
        ),
        ListTile(
          title: const Text('Tab Controller'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyTabController()));
          },
        ),
        ListTile(
          title: const Text('Form Validation'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyFormValidation()));
          },
        ),
        ListTile(
          title: const Text('Swipe To Dismiss'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MySwipeToDismiss()));
          },
        ),
        ListTile(
          title: const Text('Method Channel'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyMethodChannel()));
          },
        ),
        ListTile(
          title: const Text('슬라이드 되는 화면'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyPageView()));
          },
        ),
      ],
    );
  }
}

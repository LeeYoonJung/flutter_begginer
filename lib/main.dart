import 'package:flutter/material.dart';
import 'package:flutter_momong_project/beginner/0_flutter_cookbook/my_animated_opacity.dart';
import 'package:flutter_momong_project/beginner/0_flutter_cookbook/my_drawer.dart';
import 'package:flutter_momong_project/beginner/0_flutter_cookbook/my_orientation.dart';
import 'package:flutter_momong_project/beginner/0_flutter_cookbook/my_snack_bar.dart';

import 'beginner/0_flutter_cookbook/my_animated_container.dart';

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
        primarySwatch: Colors.blue,
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
          title: const Text('Orientation'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyOrientation()));
          },
        ),
      ],
    );
  }
}

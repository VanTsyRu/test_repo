import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

import 'export_page.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset(
                  'assets/1.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset(
                  'assets/2.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset(
                  'assets/3.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset(
                  'assets/4.png',
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: FlatButton(
                  onPressed: () {
                    Hive.box('datetimes').put('init', 1);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => HomePage()),
                        (route) => false);
                  },
                  child: Text('Начнём!')),
            ),
          ),
        ],
      ),
    );
  }
}

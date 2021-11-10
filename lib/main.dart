import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:crud_employee_v1/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return const MaterialApp(
      title: "SIM-P",
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const GetPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      body: Stack(
          children: [
            Positioned(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/pages/splashscreen/bg_splash.png'),
                    fit: BoxFit.cover,
                    scale: 0.1
                  ),
                ),
              ) 
            ),
            Positioned(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Version: 1.0.1", style: TextStyle(color: Colors.white)),
                  ],
              )
            )],
        ),
    );
  }
}

class GetPage extends StatefulWidget {
  const GetPage({Key key}) : super(key: key);

  @override
  _GetPageState createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return const MaterialApp(
      title: "SIM-P",
      home: HomePage(),
    );
  }
}

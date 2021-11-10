// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:crud_employee_v1/pages/home.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: SplashScreen(),
//     );
//   }
// }

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 4), () {
//       Navigator.of(context)
//           .pushReplacement(MaterialPageRoute(builder: (_) => const GetPage()));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/pages/splashscreen/green.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         // child: stackLogoScreen(),
//         // child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // FlutterLogo(size: 120),
//               Container(
//                 // margin: const EdgeInsets.only(bottom: 100.0),
//                 // child: Image.asset('assets/pages/splashscreen/green.png', height: 170),
//               ),
//               // const SizedBox(
//               //   height: 50,
//               // ),
//               // const CircularProgressIndicator(
//               //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//               // )
//             ],
//           // ),
//         ),
//       ),
//     );
//   }

//   // Widget stackLogoScreen() {
//   //   return Center(
//   //     child: Column(
//   //       mainAxisAlignment: MainAxisAlignment.center,
//   //       children: [
//   //         Image.asset('assets/pages/splashscreen/logo_splash.png', height: 200),
//   //         const SizedBox(
//   //           height: 50,
//   //         ),
//   //         // const CircularProgressIndicator(
//   //         //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//   //         // )
//   //       ],
//   //     ),
//   //   );
//   // }
// }

// class GetPage extends StatefulWidget {
//   const GetPage({Key key}) : super(key: key);

//   @override
//   _GetPageState createState() => _GetPageState();
// }

// class _GetPageState extends State<GetPage> {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: "SIM-P",
//       home: HomePage(),
//     );
//   }
// }

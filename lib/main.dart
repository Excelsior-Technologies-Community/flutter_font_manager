
import 'package:flutter/material.dart';
import 'Font Manager/font_provider.dart';
import 'Font Manager/demo.dart';

void main() {
  runApp(
    FontProviderWidget(
      notifier: FontProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FontDemoScreen(),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_font_manager/Font%20Manager/demo.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: FontDemoScreen(),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
//import 'package:flutter_onboarding/ui/screens/nopredict.dart';
import 'ui/root_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Onboarding Screen',
      home: RootPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

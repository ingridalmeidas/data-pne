import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'ui/login.dart';

void main() async {
  await _initHive();
  runApp(const MyApp());
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  await Hive.openBox("accounts");
  //Hive.box('accounts').clear();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white),
      home: const Login(title: 'DataPNE'),
    );
  }
}

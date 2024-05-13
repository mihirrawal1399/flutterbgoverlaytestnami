import 'package:flutter/material.dart';
import 'package:flutterbgoverlaytestnami/modules/home/home_screen.dart';
import 'package:flutterbgoverlaytestnami/modules/verification/verification_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nami Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/verify': (context) => const VerificationScreen(),
      },
    );
  }
}

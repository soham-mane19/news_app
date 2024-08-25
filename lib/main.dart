import 'package:flutter/material.dart';
import 'package:news_app/HomeScreen.dart';
import 'package:news_app/SpalshScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const Spalshscreen(),
    );
  }
}

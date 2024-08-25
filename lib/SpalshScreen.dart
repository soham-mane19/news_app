import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/HomeScreen.dart';

class Spalshscreen extends StatefulWidget {
  const Spalshscreen({super.key});

  @override
  State<Spalshscreen> createState() => _SpalshscreenState();
}

class _SpalshscreenState extends State<Spalshscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 7),
      () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(child: Image.asset('asssets/images.png')));
  }
}

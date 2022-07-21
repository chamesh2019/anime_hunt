import 'dart:async'; 

import 'package:flutter/material.dart';
import 'package:anime_hunt/pages/home/home.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var logoBox = SizedBox(
      child: Image.asset('assets/images/dark_logo.jpg'),
      height: 200,
      width: 230,
    );

    const logoText = Text(
      'ANIME HUNT',
      style: TextStyle(
          decoration: TextDecoration.none,
          fontStyle: FontStyle.normal,
          shadows: [
            Shadow(blurRadius: 1, color: Colors.red, offset: Offset(1, 1))
          ],
          color: Color.fromRGBO(255, 0, 0, 1)),
    );
    
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logoBox,
          logoText,
        ],
      ),
    );
  }

  void startTimer() {
    Timer(const Duration(seconds: 0), route);
  }

  void route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeApp())
    );
  }
}

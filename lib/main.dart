import 'package:anime_hunt/pages/err/connection.dart';
import 'package:flutter/material.dart';
import 'package:anime_hunt/pages/loader/loader.dart';

void main() {
  runApp(const BasicApp());
}

class BasicApp extends StatefulWidget {
  const BasicApp({Key? key}) : super(key: key);

  @override
  State<BasicApp> createState() => _BasicAppState();
}

class _BasicAppState extends State<BasicApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loader(),
    );
  }
}

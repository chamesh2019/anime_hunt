import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:anime_hunt/pages/home/home.dart';
import 'package:anime_hunt/pages/err/connection.dart';

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
      decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logoBox,
          logoText,
        ],
      ),
    );
  }

  Future<void> startTimer() async {
    final response = await http
        .get(Uri.parse('https://gogoanime.herokuapp.com'));

    if (response.statusCode == 200) {
      route(1);
    } else {
      route(2);
    }
  }

  void route(index) {
    if (index == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeApp()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const ConnectionError()));
    }
  }
}

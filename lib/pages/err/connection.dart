import 'package:anime_hunt/pages/loader/loader.dart';
import 'package:flutter/material.dart';

class ConnectionError extends StatelessWidget {
  const ConnectionError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Icon(
        Icons.error,
        color: Color.fromARGB(221, 244, 67, 54),
        size: 200,
      ),
      const Text(
        'There seems to be a connection error!',
        style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            decoration: TextDecoration.none,
            fontSize: 15),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: (() {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Loader()));
          }),
          child: Container(
            alignment: Alignment.center,
            height: 30,
            width: 120,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    color: Colors.black12, width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(4)),
            child: const Text(
              'Try Again',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  decoration: TextDecoration.none,
                  fontSize: 15),
            ),
          ),
        ),
      )
    ]);
  }
}

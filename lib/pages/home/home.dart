import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  bool view = true;

  @override
  Widget build(BuildContext context) {
    var headerRow = Padding(
      padding: const EdgeInsets.all(15),
      child: Row(children: [
        const Expanded(
          child: Text(
            'ANIME HUNT',
            textAlign: TextAlign.center,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontStyle: FontStyle.normal,
                fontSize: 30,
                shadows: [
                  Shadow(blurRadius: 1, color: Colors.red, offset: Offset(1, 1))
                ],
                color: Color.fromRGBO(255, 0, 0, 1)),
          ),
        ),
        SizedBox(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: const Color(0xFF890404), width: 2)),
              child: Image.asset('assets/images/dark_logo.jpg')),
          height: 50,
          width: 50,
        )
      ]),
    );

    var searchBar = Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFF1F1F1F),
        child: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: TextField(
            cursorColor: Colors.white70,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              icon: Icon(Icons.search, color: Color(0xFF8B8B8B), size: 30),
              border: InputBorder.none,
              hintText: 'Search Anime, Manga and Light Novels',
              hintStyle: TextStyle(
                color: Color(0xAA8B8B8B),
              ),
            ),
          ),
        ),
      ),
    );

    var tabBar = Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                view = !view;
              });
            },
            child: view ? const Text("THis") : const Text('Clicked'),
          )
        ],
      ),
    );

    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(13, 13, 13, 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [headerRow, searchBar, tabBar],
      ),
    );
  }

  Container contentBuilder(data) {
    return Container();
  }
}

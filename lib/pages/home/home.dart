import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> with SingleTickerProviderStateMixin {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    var headerRow = Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Row(children: [
        const Expanded(
          child: Text(
            'ANIME HUNT',
            textAlign: TextAlign.center,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontStyle: FontStyle.normal,
                fontSize: 40,
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
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFF2F2F2F),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: const Color.fromRGBO(139, 139, 139, 0.247))),
        child: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Material(
            color: Colors.transparent,
            child: TextField(
              cursorColor: Colors.white70,
              style: TextStyle(fontSize: 18, color: Colors.white),
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
      ),
    );

    var animeContainer = Container();
    var mangaContainer = Container();
    var lnContainer = Container();

    Expanded tabBuilder(index, name) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: GestureDetector(
            onTap: (() {
              setState(() {
                _selected = index;
              });
            }),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 450),
              height: 35,
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromRGBO(139, 139, 139, 0.247)),
                color: (_selected == index)
                    ? const Color.fromRGBO(255, 75, 97, 1)
                    : const Color(0xFF323232),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: (_selected == index)
                        ? const Color(0xFF323232)
                        : const Color.fromRGBO(255, 75, 97, 1),
                    decoration: TextDecoration.none,
                    fontSize: (_selected == index) ? 21 : 20,
                    fontWeight: (_selected == index)
                        ? FontWeight.w500
                        : FontWeight.normal,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    var tabBar = Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            Row(
              children: [
                tabBuilder(0, 'Anime'),
                tabBuilder(1, 'Manga'),
                tabBuilder(2, 'Light Novels')
              ],
            ),
            Builder(builder: (_) {
              if (_selected == 0) {
                return animeContainer;
              }
              if (_selected == 1) {
                return mangaContainer;
              } else {
                return lnContainer;
              }
            })
          ],
        ),
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
      ),
      child: Column(
        children: [headerRow, searchBar, tabBar],
      ),
    );
  }

  Container contentBuilder(data) {
    return Container();
  }
}

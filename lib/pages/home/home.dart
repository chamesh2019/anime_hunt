import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> with SingleTickerProviderStateMixin {
  int _selected = 0;

  @override
  void initState() {
    super.initState();
  }

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
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFF1F1F1F),
        child: const Padding(
          padding: EdgeInsets.only(left: 15),
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
              height: 30,
              decoration: BoxDecoration(
                color: (_selected == index) ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: (_selected == index) ? Colors.black : Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 20,
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
      decoration: const BoxDecoration(
        color: Color.fromRGBO(13, 13, 13, 1),
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

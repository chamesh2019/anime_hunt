import 'dart:convert';
import 'package:image_network/image_network.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> with SingleTickerProviderStateMixin {
  var animeList;

  Future getRecent() async {
    final response = await http
        .get(Uri.parse('https://gogoanime.herokuapp.com/recent-release'));

    if (response.statusCode == 200) {
      Iterable animeList = jsonDecode(response.body);
      List<Anime> dataList =
          List<Anime>.from(animeList.map((json) => Anime.fromJson(json)));
      return (dataList);
    }
  }

  @override
  void initState() {
    super.initState();
    animeList = getRecent();
  }

  @override
  Widget build(BuildContext context) {
    var headerRow = Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Row(children: const [
        Expanded(
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
        // SizedBox(
        //   child: Container(
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(5),
        //           border: Border.all(color: const Color(0xFF890404), width: 2)),
        //       child: Image.asset('assets/images/dark_logo.jpg')),
        //   height: 50,
        //   width: 50,
        // )
      ]),
    );

    var searchBar = Padding(
      padding: const EdgeInsets.only(left: 5, right: 5,  bottom: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border:
                Border.all(color: const Color.fromRGBO(139, 139, 139, 0.247))),
        child: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Material(
            color: Colors.transparent,
            child: TextField(
              style: TextStyle(fontSize: 18,),
              decoration: InputDecoration(
                icon: Icon(Icons.search, color: Color(0xFF8B8B8B), size: 25),
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

    // Expanded tabBuilder(index, name) {
    //   return Expanded(
    //     child: Padding(
    //       padding: const EdgeInsets.all(3),
    //       child: GestureDetector(
    //         onTap: (() {
    //           setState(() {
    //             _selected = index;
    //           });
    //         }),
    //         child: AnimatedContainer(
    //           duration: const Duration(milliseconds: 450),
    //           height: 35,
    //           decoration: BoxDecoration(
    //             border: Border.all(color: const Color.fromRGBO(139, 139, 139, 0.247)),
    //             color: (_selected == index)
    //                 ? const Color.fromRGBO(255, 75, 97, 1)
    //                 : const Color(0xFF323232),
    //             borderRadius: BorderRadius.circular(5),
    //           ),
    //           child: Center(
    //             child: Text(
    //               name,
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                 color: (_selected == index)
    //                     ? const Color(0xFF323232)
    //                     : const Color.fromRGBO(255, 75, 97, 1),
    //                 decoration: TextDecoration.none,
    //                 fontSize: (_selected == index) ? 21 : 20,
    //                 fontWeight: (_selected == index)
    //                     ? FontWeight.w500
    //                     : FontWeight.normal,
    //                 fontFamily: 'Poppins',
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
    // }

    // var tabBar = Padding(
    //   padding: const EdgeInsets.all(10),
    //   child: Material(
    //     color: Colors.transparent,
    //     child: Column(
    //       children: [
    //         Row(
    //           children: [
    //             tabBuilder(0, 'Anime'),
    //             tabBuilder(1, 'Manga'),
    //             tabBuilder(2, 'Light Novels')
    //           ],
    //         ),
    //         Builder(builder: (_) {
    //           if (_selected == 0) {
    //             return animeContainer;
    //           }
    //           if (_selected == 1) {
    //             return mangaContainer;
    //           } else {
    //             return lnContainer;
    //           }
    //         })
    //       ],
    //     ),
    //   ),
    // );

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [headerRow, searchBar, contentBuilder()],
      ),
    );
  }

  Container contentBuilder() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: cardBulder(),
    );
  }

//{"animeId":"hoshi-no-samidare","episodeId":"hoshi-no-samidare-episode-4",
//"animeTitle":"Hoshi no Samidare","episodeNum":"4","subOrDub":"SUB",
var imageUrl ="https://gogocdn.net/cover/hoshi-no-samidare.png";
// "episodeUrl" : "https://gogoanime.film///hoshi-no-samidare-episode-4";}

  Widget cardBulder() {
    return Material(
      child: Column(
        children: [
          ImageNetwork(
            image: imageUrl,
            imageCache: CachedNetworkImageProvider(imageUrl),
            height: 250,
            width: 150,
            duration: 1500,
            curve: Curves.easeIn,
            onPointer: true,
            debugPrint: false,
            fullScreen: false,
            fitAndroidIos: BoxFit.cover,
            fitWeb: BoxFitWeb.cover,
            borderRadius: BorderRadius.circular(70),
            onLoading: const CircularProgressIndicator(
              color: Colors.indigoAccent,
            ),
            onError: const Icon(
              Icons.error,
              color: Colors.red,
            ),
            onTap: () {
              debugPrint("©gabriel_patrick_souza");
            },
          ),
          Text('Sumidare')
        ],
      ),
    );
  }
}

class Anime {
  final String animeId;
  final String animeTitle;
  final String episodeNum;
  final String animeImg;
  final String episodeUrl;

  const Anime({
    required this.animeId,
    required this.animeTitle,
    required this.episodeNum,
    required this.animeImg,
    required this.episodeUrl,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      animeId: json['animeId'],
      animeTitle: json['animeTitle'],
      episodeNum: json['episodeNum'],
      animeImg: json['animeImg'],
      episodeUrl: json['episodeUrl'],
    );
  }
}

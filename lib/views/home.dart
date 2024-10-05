import 'package:flutter/material.dart';
import 'package:news_app_api/service/article_service.dart';
import 'package:news_app_api/widgets/card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List<String>l=[
  "general",
  "sports",
  "business",
  "health",
  "science",
  "entertainment",
  "technology",
];
class _HomeState extends State<Home> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('News App',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
          backgroundColor: const Color(0xAA51344d),
          centerTitle: true,
        ),
        backgroundColor: const Color(0xAA989788),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: i,
            onTap: (index) {
              setState(() {
                i = index;
              });
            },
            backgroundColor: const Color(0xAA51344d),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: "general",
                backgroundColor: Color(0xAA989788),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_football_rounded),
                label: "sports",
                backgroundColor: Color(0xAA989788),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business_rounded),
                label: "business",
                backgroundColor: Color(0xAA989788),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.health_and_safety_rounded),
                label: "health",
                backgroundColor: Color(0xAA989788),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.science_rounded),
                label: "science",
                backgroundColor: Color(0xAA989788),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.transit_enterexit_rounded),
                label:"entertainment",
                backgroundColor: Color(0xAA989788),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.code_rounded),
                label: "technology",
                backgroundColor: Color(0xAA989788),
              ),
            ]),
        body: FutureBuilder(
          future: ArticleService().getArticles(l[i]),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return CustomCard(cardModel: snapshot.data![index]);
                  });
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 81, 52, 77)));
            }
          },
        ));
  }
}

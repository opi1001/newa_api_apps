import 'package:flutter/material.dart';
import 'package:news_api_apps/ui/all_news.dart';
import 'package:news_api_apps/ui/breaking_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
              child: Text(
            "Flutter News App",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
          bottom: TabBar(tabs: [
            Tab(
              text: "Breaking",
            ),
            Tab(
              text: "All News",
            ),
          ]),
        ),
        body: TabBarView(children: [
          BreakingNews(),
          AllNews(),
        ]),
      ),
    );
  }
}

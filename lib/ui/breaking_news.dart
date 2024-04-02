import 'package:flutter/material.dart';
import 'package:news_api_apps/componets/news_item_list.dart';
import 'package:news_api_apps/model/news_model.dart';
import 'package:news_api_apps/service/api_service.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: apiService.getBreakingNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<NewsModel> articlelist = snapshot.data ?? [];
              return ListView.builder(
                itemBuilder: (context, index) {
                  return NewsItemList(
                    newsModel: articlelist[index],
                  );
                },
                itemCount: articlelist.length,
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

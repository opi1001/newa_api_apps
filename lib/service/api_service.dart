import 'dart:convert';
import 'package:news_api_apps/model/news_model.dart';
import 'package:http/http.dart';

class ApiService {
  final all_news_url =
      " https://newsapi.org/v2/everything?q=bitcoin&apiKey=cacc7f163c4841e684cdbe2870a4c508";

  final breaking_news_url =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=cacc7f163c4841e684cdbe2870a4c508";

  Future<List<NewsModel>> getAllNews() async {
    try {
      Response response = await get(Uri.parse(all_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articleslist =
            body.map((item) => NewsModel.fromJson(item)).toList();
        return articleslist;
      } else {
        throw ("No News found");
      }
    } catch (e) {
      throw e;
    }
  }

  Future<List<NewsModel>> getBreakingNews() async {
    try {
      Response response = await get(Uri.parse(breaking_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articleslist =
            body.map((item) => NewsModel.fromJson(item)).toList();
        return articleslist;
      } else {
        throw ("No News found");
      }
    } catch (e) {
      throw e;
    }
  }
}

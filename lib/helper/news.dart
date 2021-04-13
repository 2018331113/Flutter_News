import 'dart:convert';
import 'package:flutter_news/models/article_models.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=d0b24161afa942d2ac987edddaad4494";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if ((element['urlToImage'] != null) &&
            (element['description'] != null)) {
          ArticleModel articleModel = new ArticleModel(
            auther: element['auther'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            publishedAt: element['publishedAt'],
            content: element['content'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

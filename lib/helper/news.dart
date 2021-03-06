import 'dart:convert';
import 'dart:io';
import 'package:flutter_news/models/article_models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_news/constants.dart';

class News {
  List<ArticleModel> news = [];
  var response;
  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=${kApiKey}";
    try {
      response = await http.get(Uri.parse(url));
    } on SocketException catch (_) {
      print("Socket Exception");
    }

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

class CategoryNews {
  List<ArticleModel> news = [];
  var response;
  Future<void> getCategoryNews(String catergory) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=${catergory}&apiKey=${kApiKey}";

    try {
      response = await http.get(Uri.parse(url));
    } on SocketException catch (_) {
      print("Socket Exception");
    }
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

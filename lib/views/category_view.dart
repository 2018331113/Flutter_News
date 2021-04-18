import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/models/article_models.dart';
import 'package:flutter_news/tiles/blog_tiles.dart';
import 'package:flutter_news/views/home.dart';
import 'package:flutter_news/widgets/customAppBar.dart';

class CategoryView extends StatefulWidget {
  final String category;
  CategoryView({this.category});
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ArticleModel> articles = [];
  StreamSubscription newsSubscription;
  bool _loading = true;

  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    CategoryNews newsClass = CategoryNews();
    await newsClass.getCategoryNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidget().getAppBar(homePage: false),
      body: _loading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(12),
                child: ListView.builder(
                  physics:
                      NeverScrollableScrollPhysics(), // must use this either won't scroll
                  itemCount: articles.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return BlogTile(
                      blogTitle: articles[index].title,
                      blogDescribtion: articles[index].description,
                      imgUrl: articles[index].urlToImage,
                      url: articles[index].url,
                    );
                  },
                ),
              ),
            ),
    );
  }
}

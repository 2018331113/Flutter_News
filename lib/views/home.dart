import 'package:flutter/material.dart';
import 'package:flutter_news/helper/data.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/models/article_models.dart';
import 'package:flutter_news/models/catergory_models.dart';
import 'package:flutter_news/tiles/blog_tiles.dart';
import 'package:flutter_news/tiles/category_tiles.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool _loading = true;

  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

// always wrap listView items in a container if you want the direction to horizontal.
  @override
  Widget build(BuildContext context) {
    return _loading
        ? Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  //Category
                  Container(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CategoryTile(
                          categoryName: categories[index].categoryName,
                          imgUrl: categories[index].imgURL,
                        );
                      },
                    ),
                  ),
                  //Blogs
                  Container(
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
                ],
              ),
            ),
          );
  }
}

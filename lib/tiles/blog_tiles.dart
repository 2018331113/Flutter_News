import 'package:flutter/material.dart';
import 'package:flutter_news/views/article_view.dart';

class BlogTile extends StatelessWidget {
  final String imgUrl;
  final String blogTitle;
  final String blogDescribtion;
  final String url;
  BlogTile({this.imgUrl, this.blogTitle, this.blogDescribtion, this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(
              blogURL: url,
            ),
          ),
        );
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(imgUrl),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              blogTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              blogDescribtion,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              thickness: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BlogTile extends StatelessWidget {
  final String imgUrl;
  final String blogTitle;
  final String blogDescribtion;

  BlogTile({this.imgUrl, this.blogTitle, this.blogDescribtion});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(imgUrl),
          Text(blogTitle),
          Text(blogDescribtion),
        ],
      ),
    );
  }
}

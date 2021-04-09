import 'package:flutter/material.dart';
import 'package:flutter_news/helper/data.dart';
import 'package:flutter_news/models/catergory_models.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

// always wrap listView items in a container if you want the direction to horizontal.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CategoryWidget(
                categoryName: categories[index].categoryName,
                imgUrl: categories[index].imgURL,
              );
            },
          ),
        ),
      ],
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  final String imgUrl;

  CategoryWidget({this.categoryName, this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imgUrl,
          width: 120,
          height: 60,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String categoryName;
  final String imgUrl;

  CategoryTile({this.categoryName, this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imgUrl,
                width: 150,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 150,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black38,
              ),
              alignment: Alignment.center,
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

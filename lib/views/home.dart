import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container();
            }),
      ],
    );
  }
}

class CategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

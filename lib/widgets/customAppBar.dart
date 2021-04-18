import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomWidget {
  ///A method for showing net connectivity via Snackbar
  void getSnackBar({BuildContext context, Color color, String message}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  ///A method for creating AppBar
  ///it takes a bool parameter of which it indicates whether it is the homepage or not
  ///if not creates a additional space so that the title remains in the middle
  Widget getAppBar({bool homePage}) {
    return AppBar(
      centerTitle: true,
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Flutter"),
          Text(
            "News",
            style: TextStyle(
              color: Colors.blueAccent,
            ),
          ),
          homePage
              ? SizedBox(
                  width: 0,
                )
              : SizedBox(
                  width: 55,
                ),
        ],
      ),
    );
  }
}

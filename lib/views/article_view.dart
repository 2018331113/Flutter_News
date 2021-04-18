import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_news/widgets/customAppBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogURL;

  ArticleView({@required this.blogURL});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidget().getAppBar(homePage: false),
      body: Stack(
        children: [
          Container(
            child: WebView(
              initialUrl: widget.blogURL,
              onPageFinished: (String finish) {
                setState(() {
                  _loading = false;
                });
              },
              onWebViewCreated: ((WebViewController webViewController) {
                _completer.complete(webViewController);
              }),
            ),
          ),
          _loading
              ? Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
                  height: 0,
                ),
        ],
      ),
    );
  }
}

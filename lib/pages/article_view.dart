import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Article_View extends StatefulWidget {
  final String blogUrl;
  Article_View({required this.blogUrl});
  @override
  State<Article_View> createState() => _Article_ViewState();
}

class _Article_ViewState extends State<Article_View> {
  final Completer<WebViewController> completer=Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("News",style: TextStyle(color: Colors.black),),
            Text("Up", style: TextStyle(color: Colors.blue),),
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.save)),
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),

      body: Container(
      child: WebView(
        initialUrl:widget.blogUrl,
        onWebViewCreated: ((WebViewController webViewController){
          completer.complete(webViewController);
        })
      ),
      ));
  }
}

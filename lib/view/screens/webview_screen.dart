import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  String url;
  String source;
  WebViewScreen({Key? key, required this.url, required this.source})
      : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.source),
          centerTitle: true,
        ),
        body: SizedBox(
            width: double.infinity,
            child: widget.url == ""
                ? const Center(
                    child: Text("Unable to load webview"),
                  )
                : WebView(
                    initialUrl: widget.url,
                    javascriptMode: JavascriptMode.unrestricted,
                  )),
      ),
    );
  }
}

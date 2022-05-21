import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/view/screens/webview_screen.dart';
import 'package:flutter_news/view/utility/size_data.dart';
import 'package:get/get.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatefulWidget {
  String title;
  DateTime date;
  String sourceName;
  String content;
  String imageurl;
  String url;
  String description;
  DetailScreen(
      {Key? key,
      required this.content,
      required this.date,
      required this.description,
      required this.imageurl,
      required this.sourceName,
      required this.title,
      required this.url})
      : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final dateFormatter = DateFormat('MMMM dd h:mm a');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Material(
              color: Colors.white, // Button color
              child: InkWell(
                splashColor: Colors.red, // Splash color
                onTap: () {},
                child: InkWell(
                  onTap: (() => Get.back()),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Material(
                color: Colors.white,
                child: InkWell(
                  onTap: () async {
                    await FlutterShare.share(
                        title: 'News Talks',
                        text: widget.title,
                        linkUrl: widget.url,
                        chooserTitle: 'Example Chooser Title');
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.share),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: widget,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(26),
                    child: CachedNetworkImage(
                        imageUrl: widget.imageurl, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: myColor,
                            fontSize: 24,
                            fontFamily: fontBlack,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            widget.sourceName,
                            style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 14,
                                fontFamily: fontBlack,
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          Text(dateFormatter.format(widget.date),
                              style: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14,
                                  fontFamily: fontBlack,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.description,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: myColor,
                            fontSize: 17,
                            // fontFamily: fontBlack,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: (() {
                          Get.to(() => WebViewScreen(
                                url: widget.url,
                                source: widget.sourceName,
                              ));
                        }),
                        child: const Text(
                          "Contine Reading",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

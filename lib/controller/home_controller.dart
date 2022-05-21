import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';
import 'package:flutter_news/view/utility/constant.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_news/model/news_model.dart';
import 'package:connectivity/connectivity.dart';

class HomeController extends GetxController {
  // List<Article> articleList = <Article>[].obs;
  // var _deleteAddress;
  var isLoading = false.obs;
  List<Article> newsList = <Article>[].obs;
  ScrollController controller = ScrollController();
  int listLength = 6;
  // final connectivity = Connectivity();
  // late StreamSubscription<ConnectivityResult> subscription;
  // var isInternetConnected = false;
  @override
  void onInit() {
    super.onInit();
    // fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      newsList.clear();
      isLoading(true);
      var data = await getNews();

      for (var i = 0; i < data!.articles.length; i++) {
        // newsList = data!.articles;
        newsList.add(data.articles[i]);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<News?> getNews() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=${apiKey}"));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return News.fromJson(jsonDecode(jsonString));
    } else {
      throw Exception('Failed to load news');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_news/model/hive_news_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LocalnewsController extends GetxController {
  var items;
  Box<HiveNewsModel> cartBox = Hive.box<HiveNewsModel>("news");

  @override
  void onInit() {
    // getItems();
    super.onInit();
  }

  addToLocalDatabase(HiveNewsModel items) async {
    cartBox.add(items);
    // cartBox.
    Fluttertoast.showToast(
        msg: "Bookmarked",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

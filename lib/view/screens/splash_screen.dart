import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_news/view/screens/auth.dart';
import 'package:flutter_news/view/screens/home_page.dart';
import 'package:flutter_news/view/utility/images_data.dart';
import 'package:flutter_news/view/widgets/custom_widgets.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () async {
      Get.off(() => Authentication());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      decoration: backgroundImageBoxDecoration(imageUrl: background),
      child: Center(
        child: SizedBox(width: size.width - 80, child: Image.asset(appIcon)),
      ),
    ));
  }
}

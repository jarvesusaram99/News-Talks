import 'package:flutter/material.dart';
import 'package:flutter_news/model/hive_news_model.dart';
import 'package:flutter_news/view/screens/main_page.dart';
import 'package:flutter_news/view/screens/splash_screen.dart';
import 'package:flutter_news/view/utility/theme.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(HiveNewsModelAdapter());
  await Hive.openBox<HiveNewsModel>("news");

  await Hive.openBox('box');
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: themeData(context),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: "News Talks",
      initialRoute: '/',
      routes: {"/": ((context) => SplashScreen())},
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_news/controller/home_controller.dart';
import 'package:flutter_news/controller/local_news.dart';
import 'package:flutter_news/model/hive_news_model.dart';
import 'package:flutter_news/view/screens/detail_screen.dart';
import 'package:flutter_news/view/utility/size_data.dart';
import 'package:flutter_news/view/widgets/home_shimmer.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';

import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());
  LocalnewsController localnewsController = Get.put(LocalnewsController());
  ScrollController _scrollController = ScrollController();
  final dateFormatter = DateFormat('MMMM dd h:mm a');
  bool isBookmarked = false;
  final box = Hive.box('box');
  String? name;
  String? profileUrl;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = box.get('userName');
    profileUrl = box.get('profilePhoto');
    //   }
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(profileUrl != null
                  ? profileUrl!
                  : "https://cdn.imgbin.com/3/12/17/imgbin-computer-icons-avatar-user-login-avatar-man-wearing-blue-shirt-illustration-mJrXLG07YnZUc2bH5pGfFKUhX.jpg"),
            )),
        titleSpacing: 15,
        toolbarHeight: 60,
        title: Text(
          name != null ? "Hi, $name" : "Hi, User",
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Breaking News",
                    style: TextStyle(
                        color: myColor,
                        fontSize: 30,
                        fontFamily: fontBlack,
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ItemPageBuilder(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Trending",
                    style: TextStyle(
                        color: myColor,
                        fontSize: 30,
                        fontFamily: fontlight,
                        fontWeight: FontWeight.w900),
                  ),
                  FutureBuilder(
                      future: homeController.fetchNews(),
                      builder: (context, snapshot) {
                        return homeController.newsList.isEmpty
                            ? const ListShimmer()
                            : ListView.builder(
                                // controller: _scrollController,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: homeController.newsList.length,
                                itemBuilder: ((context, index) {
                                  final dateFormatter =
                                      DateFormat('MMMM dd h:mm a');
                                  final dateString = dateFormatter.format(
                                      homeController
                                          .newsList[index].publishedAt!);

                                  return snapshot.hasData.isBlank!
                                      ? const CircularProgressIndicator()
                                      : ValueListenableBuilder(
                                          valueListenable:
                                              Hive.box<HiveNewsModel>("news")
                                                  .listenable(),
                                          builder: (context,
                                              Box<HiveNewsModel> box, _) {
                                            return Hero(
                                              tag: homeController
                                                  .newsList[index],
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, bottom: 10),
                                                child: Container(
                                                  // width: MediaQuery.of(context).size.width,
                                                  decoration:
                                                      const BoxDecoration(),
                                                  child: Row(
                                                    // mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Get.to(() => DetailScreen(
                                                              content:
                                                                  homeController
                                                                      .newsList[
                                                                          index]
                                                                      .content!,
                                                              date: homeController
                                                                  .newsList[
                                                                      index]
                                                                  .publishedAt!,
                                                              description:
                                                                  homeController
                                                                      .newsList[
                                                                          index]
                                                                      .description!,
                                                              imageurl:
                                                                  homeController
                                                                      .newsList[
                                                                          index]
                                                                      .urlToImage!,
                                                              sourceName:
                                                                  homeController
                                                                      .newsList[
                                                                          index]
                                                                      .source!
                                                                      .name!,
                                                              title:
                                                                  homeController
                                                                      .newsList[
                                                                          index]
                                                                      .title!,
                                                              url:
                                                                  homeController
                                                                      .newsList[
                                                                          index]
                                                                      .url!));
                                                        },
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          child:
                                                              CachedNetworkImage(
                                                            fit: BoxFit.cover,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                5,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                11,
                                                            imageUrl:
                                                                homeController
                                                                    .newsList[
                                                                        index]
                                                                    .urlToImage!,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  Get.to(() => DetailScreen(
                                                                      content: homeController
                                                                          .newsList[
                                                                              index]
                                                                          .content!,
                                                                      date: homeController
                                                                          .newsList[
                                                                              index]
                                                                          .publishedAt!,
                                                                      description: homeController
                                                                          .newsList[
                                                                              index]
                                                                          .description!,
                                                                      imageurl: homeController
                                                                          .newsList[
                                                                              index]
                                                                          .urlToImage!,
                                                                      sourceName: homeController
                                                                          .newsList[
                                                                              index]
                                                                          .source!
                                                                          .name!,
                                                                      title: homeController
                                                                          .newsList[
                                                                              index]
                                                                          .title!,
                                                                      url: homeController
                                                                          .newsList[
                                                                              index]
                                                                          .url!));
                                                                },
                                                                child: Text(
                                                                    homeController
                                                                        .newsList[
                                                                            index]
                                                                        .title!,
                                                                    maxLines: 2,
                                                                    style: const TextStyle(
                                                                        color:
                                                                            myColor,
                                                                        fontSize:
                                                                            17,
                                                                        fontFamily:
                                                                            fontBlack,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        fontWeight:
                                                                            FontWeight.w700)),
                                                              ),
                                                              const SizedBox(
                                                                height: 8,
                                                              ),
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      const Icon(
                                                                        Icons
                                                                            .calendar_month,
                                                                        color: Colors
                                                                            .black45,
                                                                        size:
                                                                            18,
                                                                      ),
                                                                      Text(
                                                                          dateString,
                                                                          style: const TextStyle(
                                                                              color: Colors.black45,
                                                                              fontSize: 14,
                                                                              fontFamily: fontBlack,
                                                                              fontWeight: FontWeight.w500)),
                                                                    ],
                                                                  ),
                                                                  const Spacer(),
                                                                  InkWell(
                                                                      onTap:
                                                                          () {
                                                                        //     box.values.
                                                                        // box.values.toList()[index].url ==
                                                                        //         homeController.newsList[index].url
                                                                        //     ? Fluttertoast.showToast(msg: "Already Bookmarked", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0)
                                                                        // :

                                                                        localnewsController
                                                                            .addToLocalDatabase(
                                                                          HiveNewsModel(
                                                                              sourceName: homeController.newsList[index].source!.name!,
                                                                              title: homeController.newsList[index].title!,
                                                                              description: homeController.newsList[index].description!,
                                                                              url: homeController.newsList[index].url!,
                                                                              urlToImage: homeController.newsList[index].urlToImage!,
                                                                              publishedAt: homeController.newsList[index].publishedAt!,
                                                                              content: homeController.newsList[index].content!),
                                                                        );
                                                                      }

                                                                      // if (box.values
                                                                      //         .toList()[
                                                                      //             index]
                                                                      //         .title ==
                                                                      //     homeController
                                                                      //         .newsList[index]
                                                                      //         .title) {
                                                                      //   Fluttertoast.showToast(
                                                                      //       msg:
                                                                      //           "Already Bookmarked",
                                                                      //       toastLength: Toast
                                                                      //           .LENGTH_SHORT,
                                                                      //       gravity: ToastGravity
                                                                      //           .CENTER,
                                                                      //       timeInSecForIosWeb:
                                                                      //           1,
                                                                      //       backgroundColor:
                                                                      //           Colors.red,
                                                                      //       textColor: Colors.white,
                                                                      //       fontSize: 16.0);
                                                                      // } else {
                                                                      //   localnewsController.addToLocalDatabase(HiveNewsModel(
                                                                      //       sourceName:
                                                                      //           homeController.newsList[index].source!.name!,
                                                                      //       title: homeController.newsList[index].title!,
                                                                      //       description: homeController.newsList[index].description!,
                                                                      //       url: homeController.newsList[index].url!,
                                                                      //       urlToImage: homeController.newsList[index].urlToImage!,
                                                                      //       publishedAt: homeController.newsList[index].publishedAt!,
                                                                      //       content: homeController.newsList[index].content!));
                                                                      // }
                                                                      ,
                                                                      child: isBookmarked ==
                                                                              false
                                                                          ? const Icon(Icons
                                                                              .bookmark_add_outlined)
                                                                          : const Icon(
                                                                              Icons.bookmark))
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          });
                                }));
                      })
                ],
              ))),
    );
  }

  Widget ItemPageBuilder() {
    return FutureBuilder(
        future: homeController.fetchNews(),
        builder: (context, snapshot) => homeController.newsList.isNotEmpty
            ? SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  options: CarouselOptions(
                      reverse: true,
                      autoPlayCurve: Curves.ease,
                      height: MediaQuery.of(context).size.height / 2.9,
                      viewportFraction: 1,
                      autoPlay: true,
                      enableInfiniteScroll: false,
                      pauseAutoPlayOnTouch: true),
                  items: homeController.newsList.map((e) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => DetailScreen(
                                content: e.content!,
                                date: e.publishedAt!,
                                description: e.description!,
                                imageurl: e.urlToImage!,
                                sourceName: e.source!.name!,
                                title: e.title!,
                                url: e.url!));
                          },
                          child: Container(
                              // padding: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  // color: Colors.,
                                  color: Colors.white38,
                                  borderRadius: BorderRadius.circular(26)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(26),
                                    child: CachedNetworkImage(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      imageUrl: e.urlToImage!,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e.title!,
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
                                              e.source!.name!,
                                              style: const TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 14,
                                                  fontFamily: fontBlack,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const Spacer(),
                                            Text(
                                                dateFormatter
                                                    .format(e.publishedAt!),
                                                style: const TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 14,
                                                    fontFamily: fontBlack,
                                                    fontWeight:
                                                        FontWeight.w500))
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        );
                      },
                    );
                  }).toList(),
                ))
            : HomeShimmer());
  }
}

import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news/model/hive_news_model.dart';
import 'package:flutter_news/view/screens/detail_screen.dart';
import 'package:flutter_news/view/utility/size_data.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:showcaseview/showcaseview.dart';

class BookmarkPage extends StatelessWidget {
  BookmarkPage({Key? key}) : super(key: key);
  Box box1 = Hive.box('box');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ShowCaseWidget(
      onStart: (index, key) {
        log('onStart: $index, $key');
      },
      onComplete: (index, key) {
        box1.put('showcase', 'value');

        log('onComplete: $index, $key');
        if (index == 4) {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.light.copyWith(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.white,
            ),
          );
        }
      },
      blurValue: 1,
      builder: Builder(builder: (context) => ShowCaseListPage()),
      autoPlayDelay: const Duration(seconds: 3),
    ));
  }
}

class ShowCaseListPage extends StatefulWidget {
  ShowCaseListPage({Key? key}) : super(key: key);

  @override
  State<ShowCaseListPage> createState() => _ShowCaseListPageState();
}

class _ShowCaseListPageState extends State<ShowCaseListPage> {
  Box box1 = Hive.box('box');

  final dateFormatter = DateFormat('MMMM dd h:mm a');

  final GlobalKey _three = GlobalKey();
  // List<Mail> mails = [];

  @override
  void initState() {
    super.initState();

    // isShowcase = box1.get('showcase');
    //Start showcase view after current widget frames are drawn.
    box1.get('showcase') == null || box1.get('showcase') == ''
        ? WidgetsBinding.instance.addPostFrameCallback(
            (_) => ShowCaseWidget.of(context)!.startShowCase([
              _three,
            ]),
          )
        : print('-here we are');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text(
          "Bookmarks News",
          style: TextStyle(
              color: myColor,
              fontSize: 26,
              fontFamily: fontBlack,
              fontWeight: FontWeight.w900),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder(
                    valueListenable:
                        Hive.box<HiveNewsModel>("news").listenable(),
                    builder: (context, Box<HiveNewsModel> box, _) {
                      if (box.values.isEmpty) {
                        return const Center(
                            widthFactor: 300,
                            heightFactor: 30,
                            child: Text(
                              "No bookmarks yet.",
                              style: TextStyle(
                                  color: myColor,
                                  fontSize: 20,
                                  fontFamily: fontBlack,
                                  fontWeight: FontWeight.w400),
                            ));
                      }
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: box.values.length,
                          itemBuilder: ((context, index) {
                            if (index == 0) {
                              return fullListView(
                                  box.values.toList().first, 0, box);
                            } else {
                              return Dismissible(
                                  key: UniqueKey(),
                                  // direction: DismissDirection.endToStart,
                                  confirmDismiss:
                                      (DismissDirection direction) async {
                                    if (direction ==
                                        DismissDirection.endToStart) {
                                      await box.deleteAt(index);
                                      setState(() {
                                        setState(() {});
                                      });
                                      Fluttertoast.showToast(
                                          msg: "Removed",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    } else if (direction ==
                                        DismissDirection.startToEnd) {
                                      await box.deleteAt(index);
                                      setState(() {
                                        setState(() {});
                                      });
                                      Fluttertoast.showToast(
                                          msg: "Removed",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }

                                    // confirmDismiss:
                                    //     (DismissDirection direction) async {
                                    //   await box.deleteAt(index);
                                    //   setState(() {
                                    //     setState(() {});
                                    //   }

                                    Fluttertoast.showToast(
                                        msg: "Removed",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      // width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: InkWell(
                                              onTap: (() {
                                                Get.to(() => DetailScreen(
                                                    content: box.values
                                                        .toList()[index]
                                                        .content,
                                                    date: box.values
                                                        .toList()[index]
                                                        .publishedAt,
                                                    description: box.values
                                                        .toList()[index]
                                                        .description,
                                                    imageurl: box.values
                                                        .toList()[index]
                                                        .urlToImage,
                                                    sourceName: box.values
                                                        .toList()[index]
                                                        .sourceName,
                                                    title: box.values
                                                        .toList()[index]
                                                        .title,
                                                    url: box.values
                                                        .toList()[index]
                                                        .url));
                                              }),
                                              child: CachedNetworkImage(
                                                imageUrl: box.values
                                                        .toList()[index]
                                                        .urlToImage
                                                        .isEmpty
                                                    ? 'https://us.123rf.com/450wm/olgakot19/olgakot191912/olgakot19191200120/135111376-bitcoin-coins-are-a-stack-black-background-with-reflection.jpg?ver=6'
                                                    : box.values
                                                        .toList()[index]
                                                        .urlToImage,
                                                fit: BoxFit.cover,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    11,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    onTap: (() {
                                                      Get.to(() => DetailScreen(
                                                          content: box.values
                                                              .toList()[index]
                                                              .content,
                                                          date: box.values
                                                              .toList()[index]
                                                              .publishedAt,
                                                          description: box
                                                              .values
                                                              .toList()[index]
                                                              .description,
                                                          imageurl: box.values
                                                              .toList()[index]
                                                              .urlToImage,
                                                          sourceName: box.values
                                                              .toList()[index]
                                                              .sourceName,
                                                          title: box.values
                                                              .toList()[index]
                                                              .title,
                                                          url: box.values
                                                              .toList()[index]
                                                              .url));
                                                    }),
                                                    child: Text(
                                                        box.values
                                                            .toList()[index]
                                                            .title,
                                                        maxLines: 2,
                                                        style: const TextStyle(
                                                            color: myColor,
                                                            fontSize: 17,
                                                            fontFamily:
                                                                fontBlack,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: (() {
                                                          Get.to(() => DetailScreen(
                                                              content: box
                                                                  .values
                                                                  .toList()[
                                                                      index]
                                                                  .content,
                                                              date: box.values
                                                                  .toList()[
                                                                      index]
                                                                  .publishedAt,
                                                              description: box
                                                                  .values
                                                                  .toList()[
                                                                      index]
                                                                  .description,
                                                              imageurl: box
                                                                  .values
                                                                  .toList()[
                                                                      index]
                                                                  .urlToImage,
                                                              sourceName: box
                                                                  .values
                                                                  .toList()[
                                                                      index]
                                                                  .sourceName,
                                                              title: box.values
                                                                  .toList()[index]
                                                                  .title,
                                                              url: box.values.toList()[index].url));
                                                        }),
                                                        child: Row(
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .calendar_month,
                                                              color: Colors
                                                                  .black45,
                                                              size: 18,
                                                            ),
                                                            Text(
                                                                dateFormatter.format(box
                                                                    .values
                                                                    .toList()[
                                                                        index]
                                                                    .publishedAt),
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black45,
                                                                    fontSize:
                                                                        14,
                                                                    fontFamily:
                                                                        fontBlack,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500))
                                                          ],
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      InkWell(
                                                        onTap: () async {
                                                          await box
                                                              .deleteAt(index);
                                                          setState(() {
                                                            setState(() {});
                                                          });
                                                          Fluttertoast.showToast(
                                                              msg: "Removed",
                                                              toastLength: Toast
                                                                  .LENGTH_SHORT,
                                                              gravity:
                                                                  ToastGravity
                                                                      .CENTER,
                                                              timeInSecForIosWeb:
                                                                  1,
                                                              backgroundColor:
                                                                  Colors.red,
                                                              textColor:
                                                                  Colors.white,
                                                              fontSize: 16.0);
                                                        },
                                                        child: Icon(
                                                          Icons.delete,
                                                          color: Colors.black45,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                            }
                          }));
                    })
              ],
            )),
      ),
    );
  }

  GestureDetector fullListView(
      HiveNewsModel hiveNewsModel, int index, Box<HiveNewsModel> box) {
    return GestureDetector(
        child: Dismissible(
            key: UniqueKey(),
            // direction: DismissDirection.endToStart,
            confirmDismiss: (DismissDirection direction) async {
              if (direction == DismissDirection.endToStart) {
                await box.deleteAt(index);
                setState(() {
                  setState(() {});
                });
                Fluttertoast.showToast(
                    msg: "Removed",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else if (direction == DismissDirection.startToEnd) {
                await box.deleteAt(index);
                setState(() {
                  setState(() {});
                });
                Fluttertoast.showToast(
                    msg: "Removed",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Showcase(
                onTargetClick: () {
                  box1.put('showcase', 'value');
                },

                disposeOnTap: true,
                contentPadding: EdgeInsets.all(10),
                radius: BorderRadius.circular(8),
                // shapeBorder:,
                key: _three,
                description: 'Swipe to remove',
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: (() {
                            Get.to(() => DetailScreen(
                                content: hiveNewsModel.content,
                                date: hiveNewsModel.publishedAt,
                                description: hiveNewsModel.description,
                                imageurl: hiveNewsModel.urlToImage,
                                sourceName: hiveNewsModel.sourceName,
                                title: hiveNewsModel.title,
                                url: hiveNewsModel.url));
                          }),
                          child: CachedNetworkImage(
                            imageUrl: hiveNewsModel.urlToImage.isEmpty
                                ? 'https://us.123rf.com/450wm/olgakot19/olgakot191912/olgakot19191200120/135111376-bitcoin-coins-are-a-stack-black-background-with-reflection.jpg?ver=6'
                                : hiveNewsModel.urlToImage,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width / 5,
                            height: MediaQuery.of(context).size.height / 11,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: (() {
                                  Get.to(() => DetailScreen(
                                      content: hiveNewsModel.content,
                                      date: hiveNewsModel.publishedAt,
                                      description: hiveNewsModel.description,
                                      imageurl: hiveNewsModel.urlToImage,
                                      sourceName: hiveNewsModel.sourceName,
                                      title: hiveNewsModel.title,
                                      url: hiveNewsModel.url));
                                }),
                                child: Text(hiveNewsModel.title,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        color: myColor,
                                        fontSize: 17,
                                        fontFamily: fontBlack,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w700)),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: (() {
                                      Get.to(() => DetailScreen(
                                          content: hiveNewsModel.content,
                                          date: hiveNewsModel.publishedAt,
                                          description:
                                              hiveNewsModel.description,
                                          imageurl: hiveNewsModel.urlToImage,
                                          sourceName: hiveNewsModel.sourceName,
                                          title: hiveNewsModel.title,
                                          url: hiveNewsModel.url));
                                    }),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_month,
                                          color: Colors.black45,
                                          size: 18,
                                        ),
                                        Text(
                                            dateFormatter.format(
                                                hiveNewsModel.publishedAt),
                                            style: const TextStyle(
                                                color: Colors.black45,
                                                fontSize: 14,
                                                fontFamily: fontBlack,
                                                fontWeight: FontWeight.w500))
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () async {
                                      await box.deleteAt(index);
                                      setState(() {
                                        setState(() {});
                                      });
                                      Fluttertoast.showToast(
                                          msg: "Removed",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.black45,
                                    ),
                                  )
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
            )));
  }
}

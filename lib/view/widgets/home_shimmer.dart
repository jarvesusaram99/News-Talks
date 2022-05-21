import 'package:flutter/material.dart';
import 'package:flutter_news/view/utility/size_data.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatefulWidget {
  HomeShimmer({Key? key}) : super(key: key);

  @override
  State<HomeShimmer> createState() => _HomeShimmerState();
}

class _HomeShimmerState extends State<HomeShimmer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      child: Shimmer.fromColors(
        baseColor: Colors.white30,
        highlightColor: Colors.black26,
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
                  // child: CachedNetworkImage(
                  //   height: 200,
                  //   width: MediaQuery.of(context).size.width,
                  //   imageUrl: e.urlToImage!,
                  //   fit: BoxFit.fill,
                  // ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: myColor,
                            fontSize: 24,
                            fontFamily: fontBlack,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: const [
                          Text(
                            "",
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 14,
                                fontFamily: fontBlack,
                                fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Text("",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14,
                                  fontFamily: fontBlack,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class ListShimmer extends StatefulWidget {
  const ListShimmer({Key? key}) : super(key: key);

  @override
  State<ListShimmer> createState() => ListShimmerState();
}

class ListShimmerState extends State<ListShimmer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 700.0,
        child: Shimmer.fromColors(
            baseColor: Colors.white30,
            highlightColor: Colors.black26,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      // width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8)),

                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Text("data")),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [],
                                      ),
                                      const Spacer(),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }))));
  }
}

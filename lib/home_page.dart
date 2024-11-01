import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hot_news/list/news_list.dart';
import 'package:hot_news/widgets/button_widgets.dart';
import 'package:hot_news/widgets/texts_widgets.dart';
import 'package:intl/intl.dart';

// import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController();
  int activePage = 0;
  NewsList newsList = NewsList();
  bool isLoading = false;
  late List<bool> isBookmarkedList;

  // bool isBookmarked = false;

  getData() async {
    final response = await Dio().get(
        "https://gnews.io/api/v4/top-headlines?category=general&lang=en&country=us&max=15&apikey=4c7a6c585340d5e5fdba4c483389853b");
    print(response);
    newsList = NewsList.fromJson(response.data);
    setState(() {
      isLoading = false;
    });
    isBookmarkedList = List.filled(newsList.articles!.length, false);
  }

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: isLoading
          ? const Center(
              child: SimpleCircularProgressBar(
                size: 150,
                animationDuration: 1,
                backColor: Colors.black,
                mergeMode: true,
                progressColors: [Colors.black, Colors.white],
              ),
            )
          : PageView.builder(
              controller: pageController,
              itemCount: newsList.articles?.length,
              onPageChanged: (int page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 500,
                            width: 450,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    newsList.articles![index].image!),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(60),
                                bottomRight: Radius.circular(60),
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 70, left: 20),
                            child: Row(
                              children: [
                                // ButtonWidgets(
                                //   icon: Icon(Icons.arrow_back, color: Colors.white),
                                //   onPressed: () {
                                //     Navigator.pushReplacement(
                                //       context,
                                //       MaterialPageRoute(
                                //         builder: (context) => LoginPage(),
                                //       ),
                                //     );
                                //   },
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 320),
                                  child: ButtonWidgets(
                                    onPressed: () {
                                      setState(() {
                                        isBookmarkedList[index] =
                                            !isBookmarkedList[index];
                                      });
                                    },
                                    icon: Icon(
                                      isBookmarkedList[index]
                                          ? Icons.bookmark
                                          : Icons.bookmark_border,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 170, left: 30),
                            child: Row(
                              children: [
                                TextsWidgets(
                                  texts: DateFormat('MMM d, y').format(
                                    newsList.articles![index].publishedAt!,
                                  ),
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: TextsWidgets(
                                      texts: DateFormat('HH:mm').format(newsList
                                          .articles![index].publishedAt!),
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 240, left: 27),
                            child: TextsWidgets(
                              texts: newsList.articles?[index].title,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 420, left: 15),
                            child: TextsWidgets(
                              texts: newsList.articles?[index].url,
                              color: Colors.white,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 40, left: 20),
                      //   child: Row(
                      //     children: [
                      //       CircleAvatar(
                      //         backgroundColor: Colors.white,
                      //         radius: 22,
                      //         child: Padding(
                      //           padding:
                      //               const EdgeInsets.only(bottom: 2, left: 1),
                      //           child: Image.asset(
                      //               "lib/assets/images/facebook 2.png"),
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.only(left: 20),
                      //         child: CircleAvatar(
                      //           backgroundColor: Colors.white,
                      //           radius: 22,
                      //           child: Padding(
                      //             padding:
                      //                 const EdgeInsets.only(bottom: 1, top: 1),
                      //             child: Image.asset(
                      //                 "lib/assets/images/instagaram 2.png"),
                      //           ),
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.only(left: 20),
                      //         child: CircleAvatar(
                      //           backgroundColor: Colors.white,
                      //           radius: 22,
                      //           child: Padding(
                      //             padding:
                      //                 const EdgeInsets.only(bottom: 1, top: 1),
                      //             child: Image.asset(
                      //                 "lib/assets/images/twitter 2.png"),
                      //           ),
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.only(left: 60),
                      //         child: Container(
                      //           width: 140,
                      //           height: 50,
                      //           decoration: BoxDecoration(
                      //             color: Colors.white,
                      //             shape: BoxShape.rectangle,
                      //             borderRadius: BorderRadius.circular(7),
                      //           ),
                      //           child: const Center(
                      //             child: TextsWidgets(
                      //               color: Colors.black,
                      //               texts: "1847 comments",
                      //               size: 15,
                      //               weight: FontWeight.bold,
                      //             ),
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 35, left: 10, right: 10),
                        child: Card(
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: TextsWidgets(
                            texts: newsList.articles?[index].description,
                            color: Colors.white,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
    );
  }
}

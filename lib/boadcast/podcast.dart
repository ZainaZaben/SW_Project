import 'package:flutter/material.dart';
import 'package:flutter_project_1st/boadcast/model/podcast.dart';
import 'package:flutter_project_1st/boadcast/detailAudio.dart';
import 'package:flutter_project_1st/ipaddress.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:iconsax/iconsax.dart';

class podcast extends StatefulWidget {
  const podcast({super.key});

  @override
  State<podcast> createState() => _podcastState();
}

class _podcastState extends State<podcast> with SingleTickerProviderStateMixin {
  List<Podcast> Podcasts = [];
  bool isLoading = true;

  Future<void> fetchData() async {
    final ipAddress = await getLocalIPv4Address();
    final reportsUrl = Uri.parse('http://$ipAddress:3000/podcast');

    try {
      final response = await http.get(reportsUrl);
      if (response.statusCode == 200) {
        final List<dynamic> boadcastData = jsonDecode(response.body);

        setState(() {
          Podcasts =
              boadcastData.map((json) => Podcast.fromJson(json)).toList();
        });

        setState(() {
          isLoading = false;
        });
      } else {
        print('Failed to fetch podcasts: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      print('Error fetching podcasts: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  late ScrollController _scrollController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Scaffold(
            body: Column(
          children: [
            // Row(
            //   children: [
            //     Container(
            //       margin: const EdgeInsets.only(left: 20, right: 20),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: [
            //           Icon(
            //             Icons.menu,
            //             size: 24,
            //             color: Colors.black,
            //           ),
            //           Row(
            //             children: [
            //               Icon(Icons.search),
            //               SizedBox(
            //                 width: 10,
            //               ),
            //               Icon(Icons.notifications),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //     SizedBox(
            //       height: 20,
            //     ),
            //   ],
            // ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Popular Podcast",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 180,
            // width: double.infinity,
              //alignment: Alignment.centerLeft,
              child: PageView.builder(
                
                controller: PageController(viewportFraction: 0.4),
                scrollDirection: Axis.horizontal,
                scrollBehavior: ScrollBehavior(),
                
                itemCount: Podcasts == Null ? 0 : Podcasts.length,
                itemBuilder: (_, i) {
                  return Container(
                    height: 180,
                    width: 70,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(
                            Podcasts[i].img ?? "assets/boadcast1.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
                
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: Podcasts == null ? 0 : Podcasts.length,
                  itemBuilder: (_, i) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailAudioPage(podcast: Podcasts[i]),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                offset: Offset(0, 0),
                                color: Colors.grey.withOpacity(0.2),
                              ),
                            ],
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Container(
                                  width: 90,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(Podcasts[i].img ??
                                          "assets/boadcast1.jpg"),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 24,
                                          color: Color(0xFF17573b),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          Podcasts[i].rating.toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      Podcasts[i].title ?? "Default Title",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      Podcasts[i].text ?? "Default text",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.grey),
                                    ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      child: IconButton(
                                        onPressed: () {
                                          bool newLikeState = toggleLike(i);
                                          // Do something with the newLikeState if needed
                                        },
                                        style: IconButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shape: CircleBorder(
                                            side: BorderSide(
                                              color: Colors.grey.shade400,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                        icon: Icon(
                                          Podcasts[i].isLiked ?? false
                                              ? Iconsax.heart5
                                              : Iconsax.heart,
                                          color: Podcasts[i].isLiked ?? false
                                              ? Colors.red.shade700
                                              : Colors.black,
                                          size: 26,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),

            // Expanded(
            //   child: NestedScrollView(
            //     controller: _scrollController,
            //     headerSliverBuilder:
            //         (BuildContext context, bool isScroll) {
            //       return [
            //         SliverAppBar(
            //           pinned: true,
            //           backgroundColor: Colors.white,
            //           bottom: PreferredSize(
            //             preferredSize: Size.fromHeight(50),
            //             child: Container(
            //               margin:
            //                   const EdgeInsets.only(bottom: 20, left: 10),
            //               child: TabBar(
            //                 indicatorPadding: const EdgeInsets.all(0),
            //                 indicatorSize: TabBarIndicatorSize.label,
            //                 labelPadding:
            //                     const EdgeInsets.only(right: 10),
            //                 controller: _tabController,
            //                 isScrollable: true,
            //                 // indicator: BoxDecoration(
            //                 //   borderRadius: BorderRadius.circular(10),
            //                 //   boxShadow: [
            //                 //     BoxShadow(
            //                 //       color: Colors.grey.withOpacity(0.2),
            //                 //       blurRadius: 7,
            //                 //       offset: Offset(0, 0),
            //                 //     ),
            //                 //   ],
            //                 // ),
            //                 tabs: [
            //                   AppTabs(
            //                       color: Color(
            //                         0xFF17573b,
            //                       ),
            //                       text: "New"),
            //                   AppTabs(
            //                       color: Color(
            //                         0xFF17573b,
            //                       ),
            //                       text: "Popular"),
            //                   AppTabs(
            //                       color: Color(
            //                         0xFF17573b,
            //                       ),
            //                       text: "Trending"),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       ];
            //     },
            //     body: TabBarView(
            //       controller: _tabController,
            //       children: [

            //         // Material(
            //         //   child: ListTile(
            //         //     leading: CircleAvatar(
            //         //       backgroundColor: Colors.grey,
            //         //     ),
            //         //     title: Text("Content"),
            //         //   ),
            //         // ),
            //         // Material(
            //         //   child: ListTile(
            //         //     leading: CircleAvatar(
            //         //       backgroundColor: Colors.grey,
            //         //     ),
            //         //     title: Text("Content"),
            //         //   ),
            //         // ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        )
            //],
            ),
      ),
      //),
    );
  }

  bool toggleLike(int i) {
    setState(() {
      // If Podcasts[i].isLiked is null, set it to false
      Podcasts[i].isLiked ??= false;

      // Toggle the isLiked property
      Podcasts[i].isLiked = !Podcasts[i].isLiked!;
    });

    // Return the new state of isLiked
    return Podcasts[i].isLiked!;
  }
}

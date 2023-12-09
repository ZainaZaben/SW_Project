import 'package:flutter/material.dart';
import 'package:flutter_project_1st/chatpage/allchats.dart';
import 'package:flutter_project_1st/chatpage/myTabBar.dart';
import 'package:flutter_project_1st/chatpage/recentchats.dart';

class chatpage extends StatefulWidget {
  const chatpage({super.key});

  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF117a5d),
      body: Column(
        children: [
          MyTabBar(tabController: tabController),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 100,
                decoration: BoxDecoration(
                    color: Color(0xFFffffff),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: TabBarView(
                  controller: tabController,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          RecentChats(),
                          AllChats(),
                        ],
                      ),
                    ),
                    Center(
                      child: Text('Status'),
                    ),
                    Center(
                      child: Text('Call'),
                    ),
                  ],
                )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF33c787),
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Icon(Icons.message_outlined, color: Color(0xFFffffff))),
    );
  }
}

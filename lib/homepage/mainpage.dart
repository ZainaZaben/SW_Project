import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1st/accountpaage/accountpage.dart';
import 'package:flutter_project_1st/chatpage/chatpage.dart';
import 'package:flutter_project_1st/favoritepage/favoritepage.dart';
import 'package:flutter_project_1st/homepage/HomePage.dart';

class mainpage extends StatefulWidget {
  @override
  _mainpageState createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final pages = [
    homepage(),
    favoritepage(),
    chatpage(),
    AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffffff),
      body: pages[_page],
      bottomNavigationBar: CurvedNavigationBar(
        //index: 1,
        color: Color(0xFF117a5d),
        key: _bottomNavigationKey,
        backgroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        items: [
          Icon(Icons.home, size: 30, color: Color(0xFFffffff)),
          Icon(Icons.favorite, size: 30, color: Color(0xFFffffff)),
          Icon(Icons.chat_bubble, size: 30, color: Color(0xFFffffff)),
          Icon(Icons.account_circle_rounded,
              size: 30, color: Color(0xFFffffff)),
        ],
      ),
    );
  }
}

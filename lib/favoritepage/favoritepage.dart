import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1st/accountpaage/accountpage.dart';
import 'package:flutter_project_1st/chatpage/chatpage.dart';
import 'package:flutter_project_1st/homepage/HomePage.dart';

class favoritepage extends StatefulWidget {
  const favoritepage({super.key,required });

  @override
  State<favoritepage> createState() => _favoritepageState();
}

class _favoritepageState extends State<favoritepage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
    );
  }
}

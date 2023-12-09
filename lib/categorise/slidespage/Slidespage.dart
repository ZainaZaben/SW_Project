import 'package:flutter/material.dart';
import 'package:flutter_project_1st/categorise/RecentlyAddedItems.dart';
import 'package:flutter_project_1st/categorise/appbar_page.dart';

class Slidespage extends StatefulWidget {
  const Slidespage({super.key, required this.index});
  final int index;

  @override
  State<Slidespage> createState() => _SlidespageState();
}

class _SlidespageState extends State<Slidespage> {
  List<Map> slides = [
    {
      "id": 1,
      "image": "assets/resturants/rest1.jpeg",
      "name": "item1 ",
      "description": "description1",
    },
    {
      "id": 2,
      "image": "assets/resturants/rest2.jpeg",
      "name": "item2",
      "description": "description2",
    },
    {
      "id": 3,
      "image": "assets/resturants/rest3.jpeg",
      "name": "item3",
      "description": "description3",
    },
    {
      "id": 4,
      "image": "assets/resturants/rest4.jpeg",
      "name": "item4",
      "description": "description4",
    },
  ];
  late final PageController pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: appBarPage(),
      ),
      backgroundColor: Color(0xFFffffff).withOpacity(0.93),
      body: RecentlyaddedItems(
        array: slides,
        indexx: widget.index,
      ),
    );
  }
}

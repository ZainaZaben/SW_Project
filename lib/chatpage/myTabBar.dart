import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
      height: 80,
      color: Color(0xFF117a5d),
      child: TabBar(
          controller: tabController,
          indicator: ShapeDecoration(
            color: Color(0xFF33c787),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 0.0,
          tabs: [
            Tab(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'Chat',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFffffff)),
                ),
              ),
            ),
            Tab(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'Status',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFffffff)),
                ),
              ),
            ),
            Tab(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'Call',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFffffff)),
                ),
              ),
            ),
          ]),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project_1st/categorise/RecentlyAddedItems.dart';
import 'package:flutter_project_1st/categorise/appbar_page.dart';
import 'package:flutter_project_1st/ipaddress.dart';
import 'package:http/http.dart' as http;

class Electronicpage extends StatefulWidget {
  final int index;
  const Electronicpage({super.key, required this.index});

  @override
  State<Electronicpage> createState() => _ElectronicpageState();
}

class _ElectronicpageState extends State<Electronicpage> {
  List<Map> electronics = [];
  late final PageController pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    fetchDataFromAPI(); // Call the method to fetch data
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Future<void> fetchDataFromAPI() async {
    final ipAddress = await getLocalIPv4Address();
    final response =
        await http.get(Uri.parse('http://$ipAddress:3000/electronicpage'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        electronics = data.map((item) {
          return {
            "id": item["iditem"],
            "image": item["image"],
            "name": item["title"],
            "category": item["CategoryName"],
          };
        }).toList();
      });
    } else {
      throw Exception('Failed to load electronics items');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: appBarPage(),
      ),
      backgroundColor: Color(0xFFffffff).withOpacity(0.93),
      body: RecentlyaddedItems(array: electronics, indexx: widget.index),
    );
  }
}

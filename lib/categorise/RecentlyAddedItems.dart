import 'package:flutter/material.dart';
import 'package:flutter_project_1st/additems/clicktoAdditem.dart';
import 'package:flutter_project_1st/categorise/furniturepage/furniture_details.dart';
import 'package:flutter_project_1st/categorise/slidespage/slide_details.dart';
import 'package:flutter_project_1st/ipaddress.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class RecentlyaddedItems extends StatefulWidget {
  const RecentlyaddedItems({
    Key? key,
    required this.array,
    required this.indexx,
  }) : super(key: key);

  final List<Map> array;
  final int indexx;

  @override
  State<RecentlyaddedItems> createState() => _RecentlyaddedItemsState();
}

class _RecentlyaddedItemsState extends State<RecentlyaddedItems> {
  List<Map> Furnitures = [];
  final Map<String, Widget Function(int, List<Map>)> categoryDetailPages = {
    "Slides": (itemId, furnitures) => slideDetails(itemId: itemId),
    "Books": (itemId, furnitures) =>
        FurnitureDetails(itemId: itemId, Furnitures: furnitures),
    "Electronic": (itemId, furnitures) =>
        FurnitureDetails(itemId: itemId, Furnitures: furnitures),
    "Furniture": (itemId, furnitures) =>
        FurnitureDetails(itemId: itemId, Furnitures: furnitures),
    // Add other categories and their corresponding detail pages here
  };

  List<Map> categories = [
    {
      "name": "Slides",
      "icon": Icons.book,
    },
    {
      "name": "Books",
      "icon": Icons.book,
    },
    {
      "name": "Electronic",
      "icon": Icons.phone,
    },
    {
      "name": "Furniture",
      "icon": Icons.chair,
    },
  ];

  @override
  void initState() {
    fetchDataFromAPI(); // Call the method to fetch data
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> fetchDataFromAPI() async {
    // Replace with your API endpoint
    final ipAddress = await getLocalIPv4Address();
    print(ipAddress);
    final response =
        await http.get(Uri.parse('http://$ipAddress:3000/furniturdetails'));
    if (response.statusCode == 200) {
      print(response.statusCode);
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        Furnitures = data.map((furniture) {
          return {
            "id": furniture["iditem"],
            "image": furniture["image"],
            "title": furniture["title"],
            "category": furniture["CategoryName"],
            "status": furniture["status"],
            "Date": furniture["date"],
            "price": furniture["price"],
            "description": furniture["description"],
            "Fname": furniture["Fname"],
            "Lname": furniture["Lname"],
          };
        }).toList();
        //print("Furniture Data: $Furnitures");
      });
    } else {
      // Handle API error
      print('Failed to load furniture details');
    }
  }

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.75;
    double containerWidth1 =
        MediaQuery.of(context).size.width * 0.9; // Adjust as needed
    double containerHeight = MediaQuery.of(context).size.height * 0.12;
    double containerHeight1 = MediaQuery.of(context).size.height * 0.16;
    double containerHeight2 = MediaQuery.of(context).size.height * 0.22;
    return Column(
      children: [
        clicktoAddItem(
            containerHeight1: containerHeight1,
            containerWidth1: containerWidth1,
            containerHeight2: containerHeight2),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Recently added",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000),
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                "View all",
                style: TextStyle(
                  fontSize: 18.0,
                  color: const Color(0xFF000000).withOpacity(0.7),
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: widget.array.length,
            itemBuilder: (context, index) {
              final result = widget.array[index];
              final category = categories[widget.indexx];
              // Adjust as needed

              return Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 30,
                      left: 8,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFFffffff),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                    height: containerHeight, // Adjust based on screen size
                    width: containerWidth, // Adjust based on screen size
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            result["image"],
                            width: 120,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          result["name"],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          result["category"],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      // Get the category name from the current slide
                      final categoryName = category["name"];
                      await fetchDataFromAPI();

                      // Check if a detail page is defined for the category
                      if (categoryDetailPages.containsKey(categoryName)) {
                        final detailPageBuilder =
                            categoryDetailPages[categoryName];
                        if (detailPageBuilder != null) {
                          // Build and navigate to the appropriate detail page
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                detailPageBuilder(result["id"], Furnitures),
                          ));
                        }
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 30, right: 8),
                      decoration: const BoxDecoration(
                        color: Color(0xFF117a5d),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      height: containerHeight, // Adjust based on screen size
                      width: MediaQuery.of(context).size.width *
                          0.2, // Adjust based on screen size
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 70, // Adjust the size to your preference
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_project_1st/categorise/electronicpage/Electronicpage.dart';
import 'package:flutter_project_1st/categorise/furniturepage/Furniturepage.dart';
import 'package:flutter_project_1st/categorise/slidespage/Slidespage.dart';

class CategoriesSection extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categorise",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000),
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                "View All",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xFF000000).withOpacity(0.7),
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (categories[index]['name'] == 'Slides') {
                    // Check if the category is 'Slides' and navigate to SlidesPage
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Slidespage(index: 0),
                    ));
                  } else if (categories[index]['name'] == 'Books') {
                    // Check if the category is 'Slides' and navigate to SlidesPage
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Slidespage(index: 1),
                    ));
                  } else if (categories[index]['name'] == 'Electronic') {
                    // Check if the category is 'Slides' and navigate to SlidesPage
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Electronicpage(index: 2),
                    ));
                  } else if (categories[index]['name'] == 'Furniture') {
                    // Check if the category is 'Slides' and navigate to SlidesPage
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Furniturepage(index: 3),
                    ));
                  }
                },
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(23.0),
                        margin: EdgeInsets.only(left: 18, right: 18),
                        decoration: BoxDecoration(
                          color: Color(0xFFffffff),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xFFd6d6d6).withOpacity(0.7),
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          categories[index]['icon'],
                          size: 25,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        categories[index]['name'],
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

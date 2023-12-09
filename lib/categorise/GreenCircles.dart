import 'package:flutter/material.dart';

class GreenCricles extends StatelessWidget {
  const GreenCricles({
    super.key,
    required this.item,
  });

  final Map item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: const Color(0xFF117a5d),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["title"],
                  style: const TextStyle(
                    color: Color(0xFFffffff),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 15, // Adjust the position as needed
            top: 70, // Adjust the position as needed
            child: Container(
              width: 45, // Adjust the width as needed
              height: 70, // Adjust the height as needed
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF33c787), // Adjust the color as needed
              ),
              child: Icon(
                Icons.person_sharp,
                color: Color(0xFFffffff),
                size: 30,
              ),
              // Add any content or widgets you want inside the circular container
            ),
          ),
          Positioned(
            left: 15, // Adjust the position as needed
            top: 135, // Adjust the position as needed
            child: Container(
              width: 45, // Adjust the width as needed
              height: 70, // Adjust the height as needed
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF33c787), // Adjust the color as needed
              ),
              child: Icon(
                Icons.book,
                color: Color(0xFFffffff),
                size: 30,
              ),
              // Add any content or widgets you want inside the circular container
            ),
          ),
          Positioned(
            left: 15, // Adjust the position as needed
            top: 200, // Adjust the position as needed
            child: Container(
              width: 45, // Adjust the width as needed
              height: 70, // Adjust the height as needed
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF33c787), // Adjust the color as needed
              ),
              child: Icon(
                Icons.date_range_rounded,
                color: Color(0xFFffffff),
                size: 30,
              ),
              // Add any content or widgets you want inside the circular container
            ),
          ),
          Positioned(
            left: 75, // Adjust the position as needed
            top: 85, // Adjust the position as needed
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Name",
                style: const TextStyle(
                  color: Color(0xFFffffff),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                item["Fname"] + " " + item["Lname"],
                style: const TextStyle(
                  color: Color(0xFFffffff),
                  fontSize: 12,
                ),
              ),
            ]),
          ),
          Positioned(
            left: 75, // Adjust the position as needed
            top: 145, // Adjust the position as needed
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Category",
                style: const TextStyle(
                  color: Color(0xFFffffff),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                item["category"],
                style: const TextStyle(
                  color: Color(0xFFffffff),
                  fontSize: 12,
                ),
              ),
            ]),
          ),
          Positioned(
            left: 75, // Adjust the position as needed
            top: 210, // Adjust the position as needed
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Date",
                style: const TextStyle(
                  color: Color(0xFFffffff),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                item["Date"],
                style: const TextStyle(
                  color: Color(0xFFffffff),
                  fontSize: 12,
                ),
              ),
            ]),
          ),
          Positioned(
            right: 3, // Adjust the position as needed
            top: 80, // Adjust the position as needed
            child: Container(
              width: 230, // Adjust the width as needed
              height: 200, // Adjust the height as needed
              decoration: BoxDecoration(
                shape: BoxShape.rectangle, // Rectangle for the image
                color: Colors.white, // Adjust the color as needed
                image: DecorationImage(
                  image: AssetImage(item["image"]), // Provide your image path
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

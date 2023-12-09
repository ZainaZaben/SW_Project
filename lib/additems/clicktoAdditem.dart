import 'package:flutter/material.dart';
import 'package:flutter_project_1st/additems/additem.dart';

class clicktoAddItem extends StatelessWidget {
  const clicktoAddItem({
    super.key,
    required this.containerHeight1,
    required this.containerWidth1,
    required this.containerHeight2,
  });

  final double containerHeight1;
  final double containerWidth1;
  final double containerHeight2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: containerHeight1,
            decoration: BoxDecoration(
              color: const Color(0xFF117a5d).withOpacity(0.7),
              borderRadius: const BorderRadius.only(
                // topLeft: Radius.circular(12),
                bottomLeft: Radius.elliptical(40.0, 40.0),
                // topRight: Radius.circular(12),
                bottomRight: Radius.elliptical(40.0, 40.0),
              ),
            )),
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => addPost(),
              ));
            },
            child: Container(
              margin: EdgeInsets.all(30),
              width: containerWidth1,
              height: containerHeight2, // Set the desired height
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Click to add item",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 35,
                            color: Color.fromARGB(255, 170, 170, 170),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Icon(
                          Icons.add_a_photo_outlined,
                          color: Color.fromARGB(255, 170, 170, 170),
                          size: 50, // Adjust the size to your preference
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

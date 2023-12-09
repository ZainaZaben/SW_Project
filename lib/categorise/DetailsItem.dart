import 'package:flutter/material.dart';

class DetailsItem extends StatelessWidget {
  final BoxConstraints constraints;
  const DetailsItem({
    super.key,
    required this.constraints,
    required this.item,
  });
  final Map item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: constraints.maxHeight,
      height: 400,
      color: Color(0xFFf0eff5),
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 10,
          ),
          Text(
            " Details",
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              color: Color(0xFFc0edda),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  "price",
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Text(
                  item["price"] + "₪",
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              color: Color(0xFFc0edda),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  "Stauts",
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Text(
                  item["status"],
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            " Description",
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            item["description"],
            style: TextStyle(
              //color: Color(0xFF000000),
              fontSize: 14,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 25,
          ),
        ]),
      ),
    );
  }
}

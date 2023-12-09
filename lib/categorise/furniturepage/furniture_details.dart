import 'package:flutter/material.dart';
import 'package:flutter_project_1st/categorise/DetailsItem.dart';
import 'package:flutter_project_1st/categorise/GreenCircles.dart';
import 'package:flutter_project_1st/categorise/appbar_details.dart';
import 'package:flutter_project_1st/categorise/bottomNavigationbar.dart';

class FurnitureDetails extends StatefulWidget {
  const FurnitureDetails({
    Key? key,
    required this.itemId,
    required this.Furnitures,
  }) : super(key: key);
  final int itemId;
  final List<Map> Furnitures;
  @override
  State<FurnitureDetails> createState() => _FurnitureDetailsState();
}

class _FurnitureDetailsState extends State<FurnitureDetails> {
  @override
  Widget build(BuildContext context) {
    final item = widget.Furnitures.firstWhere(
        (Furniture) => Furniture["id"] == widget.itemId);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: appBarDetails(),
      ),
      // backgroundColor: Color(0xFFffffff),
      body: LayoutBuilder(
        builder: ((context, constraints) {
          return Container(
            child: Column(
              children: [
                GreenCricles(item: item),
                DetailsItem(constraints: constraints, item: item)
              ],
            ),
          );
        }),
      ),

      bottomNavigationBar: BottomNav(),
    );
  }
}

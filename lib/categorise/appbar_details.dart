import 'package:flutter/material.dart';

class appBarDetails extends StatelessWidget {
  const appBarDetails({Key? key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF117a5d),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.grey.shade200,
          size: 30,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            // Handle notification icon press
          },
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.grey.shade200,
          ),
        ),
        IconButton(
          onPressed: () {
            // Handle notification icon press
          },
          icon: Icon(
            Icons.filter_list,
            size: 30,
            color: Colors.grey.shade200,
          ),
        ),
      ],
    );
  }
}
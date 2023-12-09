import 'package:flutter/material.dart';
import 'package:flutter_project_1st/categorise/appbar_page.dart';

class addPost extends StatefulWidget {
  const addPost({super.key});

  @override
  State<addPost> createState() => _addPostState();
}

class _addPostState extends State<addPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: appBarPage(),
      ),
      backgroundColor: Colors.white,
    );
  }
}

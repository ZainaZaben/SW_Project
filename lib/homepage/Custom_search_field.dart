import 'package:flutter/material.dart';
import 'package:flutter_project_1st/helpPage/help.dart';
import 'package:flutter_project_1st/homepage/searchresult.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: 'Search Items',
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.filter_list),
              contentPadding: EdgeInsets.all(18),
              filled: true,
              fillColor:
                  Color(0xFFebedee).withOpacity(0.85), // Background color
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10), // Rounded border
                borderSide: BorderSide.none,
              ),
              hintStyle: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 170, 170, 170),
              ),
            ),
            style: TextStyle(fontSize: 20, color: Color(0xFF000000)),
            onTap: () {
              // Remove the focus from the TextField to prevent the keyboard from appearing
              _focusNode.unfocus();

              // When the search TextField is tapped, navigate to the SearchResultsPage
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchResult(
                  controller: _searchController,
                ),
              ));
            },
            // Assign the FocusNode to the TextField
            focusNode: _focusNode,
          ),
        ],
      ),
    );
  }
}

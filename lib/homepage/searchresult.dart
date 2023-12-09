import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<Map<String, dynamic>> _allitems = [
    {"id": 1, "name": "slide1 ", "price": 10},
    {"id": 2, "name": "bool", "price": 20},
    {"id": 3, "name": "fridge", "price": 30},
    {"id": 4, "name": "bed", "price": 40},
    {"id": 5, "name": "data", "price": 50},
    {"id": 6, "name": "slide6", "price": 60},
    {"id": 7, "name": "slide7", "price": 70},
    {"id": 8, "name": "slide7", "price": 80},
    {"id": 9, "name": "slide7", "price": 90},
    {"id": 10, "name": "slide7", "price": 100},
  ];

  List<Map<String, dynamic>> _founditems = [];
  bool isTextFieldFocused = true; // Track the focus state

  @override
  void initState() {
    super.initState();
    //FocusScope.of(context).requestFocus(_focusNode);
    Future.delayed(Duration.zero, () {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allitems;
    } else {
      results = _allitems
          .where((item) =>
              item["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _founditems = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _controller,
                  focusNode: _focusNode,
                  onChanged: (value) => _runFilter(value),
                  decoration: InputDecoration(
                    hintText: 'Search Items',
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.all(10),
                    filled: true,
                    fillColor: Color(0xFFebedee).withOpacity(0.85),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 170, 170, 170),
                    ),
                  ),
                  style: TextStyle(fontSize: 20, color: Color(0xFF000000)),
                  onTap: () {
                    setState(() {
                      isTextFieldFocused = true;
                    });
                  },
                  onFieldSubmitted: (_) {
                    setState(() {
                      isTextFieldFocused = false;
                    });
                  },
                ),
              ),
              isTextFieldFocused
                  ? TextButton(
                      onPressed: () {
                        setState(() {
                          _controller.clear();
                          _runFilter('');
                          FocusScope.of(context).unfocus();
                          isTextFieldFocused = false;
                          Navigator.pop(context);
                        });
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF000000).withOpacity(0.7)),
                      ),
                    )
                  : Container(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // Conditionally display the item list based on focus state
          if (isTextFieldFocused)
            Expanded(
              child: ListView.builder(
                itemCount: _founditems.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_founditems[index]["id"]),
                  color: Color(0xFFc0edda),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Text(
                      _founditems[index]["id"].toString(),
                      style: const TextStyle(
                        fontSize: 24,
                        color: Color(0xFFffffff),
                      ),
                    ),
                    title: Text(
                      _founditems[index]['name'],
                      style: TextStyle(color: Color(0xFFffffff)),
                    ),
                    subtitle: Text(
                      '${_founditems[index]["price"].toString()} dollars',
                      style: TextStyle(color: Color(0xFFffffff)),
                    ),
                  ),
                ),
              ),
            ),
        ]),
      ),
    );
  }
}

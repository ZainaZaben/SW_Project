import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project_1st/categorise/furniturepage/furniture_details.dart';
import 'package:flutter_project_1st/categorise/homemadeCooking/homeMadeDetails.dart';
import 'package:flutter_project_1st/ipaddress.dart';
import 'package:flutter_project_1st/registerID.dart';
import 'package:flutter_project_1st/settingpage/theme/theme_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key, required this.favorites}) : super(key: key);
  final List<Map<String, dynamic>> favorites;

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<bool> showContainerList = List.generate(100, (index) => false);
  List<bool> showContainerList1 = List.generate(100, (index) => false);

  List<Map<String, dynamic>> items = [];
  List<Map<String, dynamic>> favmealsArray = [];
  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    try {
      final userData = Provider.of<UserData>(context, listen: false);
      final registerID = userData.registerID;
      favmealsArray = await getfavoritemeals(registerID.toString());
      print('favmealsArray$favmealsArray');
    } catch (error) {
      // Handle errors
      print('Error initializing data: $error');
    }
  }

  Future<List<Map<String, dynamic>>> getfavoritemeals(String registerID) async {
    final ipAddress = await getLocalIPv4Address();
    final String apiUrl =
        "http://$ipAddress:3000/getfavoritesMeals/$registerID";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Parse the response body
        List<dynamic> data = json.decode(response.body);

        // Convert the list of dynamic to List<Map<String, dynamic>>
        List<Map<String, dynamic>> favmealsArray =
            List<Map<String, dynamic>>.from(data);
        return favmealsArray;
      } else {
        throw Exception(
            'Failed to load reserved items. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Provide more meaningful error handling or logging
      print('Error fetching reserved items: $e');
      throw Exception('Failed to load reserved items');
    }
  }

  Future<bool> checkFavorite(int itemId, int registerId) async {
    final ipAddress = await getLocalIPv4Address();
    print(ipAddress);
    final apiUrl = 'http://$ipAddress:3000/checkFavorite/$itemId/$registerId';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data['isFavorite'];
      } else {
        // Handle error
        print('Error: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      // Handle exceptions
      print('Exception: $error');
      return false;
    }
  }

  Future<bool> checkReserved(int itemId, int registerId) async {
    final ipAddress = await getLocalIPv4Address();
    print(ipAddress);
    final apiUrl = 'http://$ipAddress:3000/checkReserved/$itemId/$registerId';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data['isReserved'];
      } else {
        // Handle error
        print('Error: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      // Handle exceptions
      print('Exception: $error');
      return false;
    }
  }

  //************for item details: ********************//
  List<Map<String, dynamic>> _allitems = [];

  Future<void> searchItemsResults() async {
    // Replace with your API endpoint
    final ipAddress = await getLocalIPv4Address();
    print("*********************************************");
    print(ipAddress);
    final response =
        await http.get(Uri.parse('http://$ipAddress:3000/searchItems'));
    if (response.statusCode == 200) {
      print(response.statusCode);
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        _allitems = data.map((item) {
          return {
            "id": item["iditem"],
            "title": item["title"],
            "price": item["price"],
            "image": item["image"],
            "category": item["CategoryName"],
            "Date": item["date"],
            "phoneNumber": item["phoneNumber"],
            "status": item["status"],
            "description": item["description"],
            "Fname": item["Fname"],
            "Lname": item["Lname"],
          };
        }).toList();
        print("Items details: $_allitems");
      });
    } else {
      // Handle API error
      print('Failed to load furniture details');
    }
  }

  String errorMessage = '';

  Future<void> deletefavorite({
    required String iditem,
    required BuildContext context,
    required int index,
    required String registerid,
  }) async {
    final ipAddress = await getLocalIPv4Address();
    final url = Uri.parse('http://$ipAddress:3000/deletefavorite');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {'iditem': iditem, 'registerID': registerid},
      );

      if (response.statusCode == 200) {
        // Data sent successfully
        setState(() {
// Update the local state
          setState(() {
            items.removeAt(index); // Remove the item from the list
          });
        });
        print('Deleted successful');
      } else {
        // Handle errors or server response based on status code
        setState(() {
          errorMessage = 'error';
        });
        print('HTTP error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or other errors
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    print('inside Favorites:');
    print(widget.favorites);
    items = widget.favorites;

    // Check if the items list is empty
    if (items.isEmpty) {
      return Center(
        child: Text(
          'No favorite items',
          style: TextStyle(
            fontSize: 20,
            color:
                themeProvider.isDarkMode ? Color(0xFFffffff) : Colors.black87,
          ),
        ),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < items.length; i += 2)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildItem(items[i], i),
                        SizedBox(
                          width: 15,
                        ),
                        if (i + 1 < items.length)
                          buildItem(items[i + 1], i + 1),
                      ],
                    ),
                    SizedBox(height: 20.0), // Add space between rows
                  ],
                ),
              for (int j = 0; j < favmealsArray.length; j += 2)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildItemMeals(favmealsArray[j], j),
                        SizedBox(
                          width: 15,
                        ),
                        if (j + 1 < favmealsArray.length)
                          buildItemMeals(favmealsArray[j + 1], j + 1),
                      ],
                    ),
                    SizedBox(height: 20.0), // Add space between rows
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildItem(Map<String, dynamic> item, int index) {
    final userData = Provider.of<UserData>(context);
    final registerID = int.parse(userData.registerID);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            showContainerList[index] = !showContainerList[index];
          });
        },
        child: Container(
          height: 265,
          width: 180,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.black.withOpacity(0.8),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              item['softCopy'] == 0
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: kIsWeb
                          ? Image.network(
                              item['image'],
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              File(
                                item['image'],
                              ),
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/pdf.png",
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () async {
                            await deletefavorite(
                                context: context,
                                iditem: items[index]["iditem"].toString(),
                                index: index,
                                registerid: registerID.toString());
                          },
                          child: Icon(
                            Icons.favorite_rounded,
                            color: const Color(0xFF000000).withOpacity(0.7),
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  showContainerList[index]
                      ? GestureDetector(
                          onTap: () async {
                            if (items[index]["softCopy"] == 0) {
                              final isFavorite = await checkFavorite(
                                  items[index]["iditem"], registerID);
                              print("isfavvv:");
                              print(isFavorite);

                              final isReserved = await checkReserved(
                                  items[index]["iditem"], registerID);
                              await searchItemsResults();
                              final updatedFavorites =
                                  await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => FurnitureDetails(
                                    itemId: items[index]["iditem"],
                                    Furnitures: _allitems,
                                    isFavorite: isFavorite,
                                    isReserved: isReserved,
                                    showNavBar: true,
                                    gotoFav: true,
                                  ),
                                ),
                              );
                              if (updatedFavorites != null) {
                                setState(() {
                                  items = List.from(updatedFavorites);
                                });
                              }
                            }

                            // setState(() {
                            //   Navigator.of(context).push(MaterialPageRoute(
                            //       builder: (context) => FurnitureDetails(
                            //             itemId: items[index]["iditem"],
                            //             Furnitures: _allitems,
                            //             isFavorite: isFavorite,
                            //           )));
                            // });
                          },
                          child: Container(
                            height: 65,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFF000000).withOpacity(0.7),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    item['title'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFFffffff),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    item['price'].toString() + "₪",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFFffffff),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //**************************************//
  Widget buildItemMeals(Map<String, dynamic> favmealsArray, int index) {
    final userData = Provider.of<UserData>(context);
    final registerID = int.parse(userData.registerID);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            showContainerList1[index] = !showContainerList1[index];
          });
        },
        child: Container(
          height: 265,
          width: 180,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.black.withOpacity(0.8),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: kIsWeb
                    ? Image.network(
                        favmealsArray['image'],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(
                          favmealsArray['image'],
                        ),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () async {
                            await deletefavorite(
                                context: context,
                                iditem:
                                    favmealsArray[index]["idmeals"].toString(),
                                index: index,
                                registerid: registerID.toString());
                          },
                          child: Icon(
                            Icons.favorite_rounded,
                            color: const Color(0xFF000000).withOpacity(0.7),
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  showContainerList1[index]
                      ? GestureDetector(
                          onTap: () async {
                            print("inside fav meals");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homeMadeDetails(
                                          idmeals: favmealsArray["idmeals"],
                                          image: favmealsArray['image'],
                                          mealtitle: favmealsArray['mealtitle'],
                                          price: favmealsArray['price'],
                                          details: favmealsArray['details'],
                                          count: favmealsArray['count'],
                                          leftOver: favmealsArray['leftOver'],
                                        )));
                            // setState(() {
                            //   Navigator.of(context).push(MaterialPageRoute(
                            //       builder: (context) => FurnitureDetails(
                            //             itemId: items[index]["iditem"],
                            //             Furnitures: _allitems,
                            //             isFavorite: isFavorite,
                            //           )));
                            // });
                          },
                          child: Container(
                            height: 65,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFF000000).withOpacity(0.7),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    favmealsArray['mealtitle'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFFffffff),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    favmealsArray['price'].toString() + "₪",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFFffffff),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project_1st/generated/l10n.dart';
import 'package:flutter_project_1st/ipaddress.dart';
import 'package:flutter_project_1st/settingpage/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'offerAppBar.dart';
import 'offerDetails.dart';

class offer3main extends StatefulWidget {
  const offer3main({super.key});

  @override
  State<offer3main> createState() => _offermainState();
}

class _offermainState extends State<offer3main> {
  List<Map<String, dynamic>> offer3Array = [];
  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    try {
      offer3Array = await getOffers3("3");
      print('offer1Array: $offer3Array');

      if (offer3Array.isNotEmpty) {
        setState(() {
          offer3Array = offer3Array;
        });
      }
    } catch (error) {
      // Provide more meaningful error handling or logging
      print('Error initializing data: $error');
    }
  }

  Future<List<Map<String, dynamic>>> getOffers3(String idoffers) async {
    final ipAddress = await getLocalIPv4Address();
    final String apiUrl = "http://$ipAddress:3000/getOffers/$idoffers";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Parse the response body
        List<dynamic> data = json.decode(response.body);

        // Convert the list of dynamic to List<Map<String, dynamic>>
        List<Map<String, dynamic>> offer3Array =
            List<Map<String, dynamic>>.from(data);
        return offer3Array;
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

  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    // List<String> offerTitles = [
    //   'البزرة للمفروشات',
    //   'مفروشات قصر الأحلام',
    //   'مفروشات الريان',
    // ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: appBarOffers(),
      ),
      backgroundColor: themeProvider.isDarkMode
          ? Color.fromARGB(255, 37, 37, 37).withOpacity(0.3)
          : Color(0xFFffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Text(
                S.of(context).Furniture_offers,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: offer3Array.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            'assets/offers/offer3.jpg',
                            height: kIsWeb ? 420 : 320,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => offerDetails(
                                            offerDetailID: offer3Array[index]
                                                ["idofferNames"],
                                            discount: offer3Array[index]
                                                    ["discount"]
                                                .toString(),
                                            phoneNumber: offer3Array[index]
                                                    ["phoneNumber"]
                                                .toString(),
                                            details: offer3Array[index]
                                                    ["details"]
                                                .toString(),
                                            location: offer3Array[index]
                                                    ["location"]
                                                .toString(),
                                          )));
                            },
                            child: Container(
                              height: 80,
                              width: 320,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.white.withOpacity(0.9),
                              ),
                              child: Center(
                                child: Text(
                                  offer3Array[index]["offerDetails"],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

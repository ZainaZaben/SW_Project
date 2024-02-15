import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project_1st/generated/l10n.dart';
import 'package:flutter_project_1st/ipaddress.dart';
import 'package:flutter_project_1st/settingpage/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'offerAppBar.dart';

class offerDetails extends StatefulWidget {
  const offerDetails(
      {super.key,
      required this.offerDetailID,
      required this.discount,
      required this.phoneNumber,
      required this.details,
      required this.location});
  final int offerDetailID;
  final String discount;
  final String phoneNumber;
  final String details;
  final String location;

  @override
  State<offerDetails> createState() => _offerDetailsState();
}

class _offerDetailsState extends State<offerDetails> {
  List<Map> offerdetails = [];
  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    try {
      offerdetails = await getOfferdetails(widget.offerDetailID.toString());
      print('offerdetails: $offerdetails');

      if (offerdetails.isNotEmpty) {
        setState(() {
          offerdetails = offerdetails;
        });
      }
    } catch (error) {
      // Provide more meaningful error handling or logging
      print('Error initializing data: $error');
    }
  }

  Future<List<Map>> getOfferdetails(String idofferNames) async {
    final ipAddress = await getLocalIPv4Address();
    final String apiUrl =
        "http://$ipAddress:3000/getOfferDetails/$idofferNames";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Parse the response body
        List<dynamic> data = json.decode(response.body);

        // Convert the list of dynamic to List<Map<String, dynamic>>
        List<Map> offerdetails = List<Map>.from(data);
        return offerdetails;
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

    // List<Map> offerTitles = [
    //   {"id": 1, "offerdetailsName": 'Technolab', "price": 20},
    //   {"id": 2, "offerdetailsName": 'Electro Tech', "price": 20},
    //   {"id": 3, "offerdetailsName": 'أبو زهرة الكترونيك', "price": 20}
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
                S.of(context).offers,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 380,
                  child: offerdetails.isEmpty
                      ? Center(
                          child: Text(
                            "There is no offers to display yet",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: offerdetails.length,
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
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: kIsWeb
                                          ? Image.network(
                                              offerdetails[index]["image"],
                                              height: 380,
                                              width: 320,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.file(
                                              File(
                                                  offerdetails[index]["image"]),
                                              //'assets/offers/offer1.jpg',
                                              height: 380,
                                              width: 320,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                    Positioned(
                                      bottom: 15,
                                      left: 20,
                                      child: GestureDetector(
                                        onTap: () {
                                          // Handle offer item tap
                                        },
                                        child: Container(
                                          height: 80,
                                          width: 280,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            color:
                                                Colors.white.withOpacity(0.9),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Center(
                                                child: Text(
                                                  offerdetails[index]
                                                      ["offerdetailsName"],
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  offerdetails[index]["price"]
                                                          .toString() +
                                                      "₪",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color:
                                Colors.black12, // Set the border color to green
                            width: 1.0, // Set the border width as needed
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 2),
                            ),
                          ],
                          // boxShadow: ,
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.discount, size: 30, color: Colors.black),
                          SizedBox(height: 5),
                          Text(
                            widget.discount + "%",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchPhone(widget.phoneNumber);
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Colors
                                  .black12, // Set the border color to green
                              width: 1.0, // Set the border width as needed
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 2),
                              ),
                            ],
                            // boxShadow: ,
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.phone, size: 30, color: Colors.black),
                            SizedBox(height: 5),
                            Text(
                              widget.phoneNumber,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchGoogleMaps(widget.location);
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Colors
                                  .black12, // Set the border color to green
                              width: 1.0, // Set the border width as needed
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 2),
                              ),
                            ],
                            // boxShadow: ,
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on,
                                size: 30, color: Colors.black),
                            SizedBox(height: 5),
                            Text(
                              "location",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    S.of(context).Details,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: themeProvider.isDarkMode
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: Text(
                    widget.details,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: themeProvider.isDarkMode
                          ? Colors.white
                          : Colors.black45,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _launchGoogleMaps(String location) async {
    final locationn = location.isNotEmpty ? location : "32.2263,35.2218";
    final url = 'https://www.google.com/maps/search/?api=1&query=$locationn';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchPhone(String phone) async {
    final phoneNumber = 'tel:$phone';
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
}

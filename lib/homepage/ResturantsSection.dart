import 'package:flutter/material.dart';
import 'package:flutter_project_1st/generated/l10n.dart';
import 'package:flutter_project_1st/offers/offer1.dart';
import 'package:flutter_project_1st/offers/offer2.dart';
import 'package:flutter_project_1st/offers/offer3.dart';
import 'package:flutter_project_1st/offers/offer4.dart';
import 'package:flutter_project_1st/settingpage/theme/theme_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ResturantsSection extends StatefulWidget {
  const ResturantsSection({super.key});

  @override
  State<ResturantsSection> createState() => _ResturantsSectionState();
}

class _ResturantsSectionState extends State<ResturantsSection> {
  List<Map> resturants = [
    {
      "id": 1,
      "image": "assets/offers/offer1.jpg",
      "name": Intl.getCurrentLocale() == 'ar' ? "إلكترونيات" : "Electronic",
      "description": Intl.getCurrentLocale() == 'ar'
          ? "اضغط لرؤية عروضات الإلكترونيات"
          : "Click to see Electronic offers",
    },
    {
      "id": 2,
      "image": "assets/offers/offer2.jpg",
      "name": Intl.getCurrentLocale() == 'ar' ? "كهربائيات" : "Electricals",
      "description": Intl.getCurrentLocale() == 'ar'
          ? "اضغط لرؤية عروضات الكهربائيات"
          : "Click to see Electricals offers",
    },
    {
      "id": 3,
      "image": "assets/offers/offer3.jpg",
      "name": Intl.getCurrentLocale() == 'ar' ? "مفروشات" : "Furniture",
      "description": Intl.getCurrentLocale() == 'ar'
          ? "اضغط لرؤية عروضات المفروشات"
          : "Click to see Furniture offers",
    },
    {
      "id": 4,
      "image": "assets/resturants/rest4.jpeg",
      "name": Intl.getCurrentLocale() == 'ar' ? "مطاعم" : "Restaurants",
      "description": Intl.getCurrentLocale() == 'ar'
          ? "اضغط لرؤية عروضات المطاعم"
          : "Click to see Restaurants offers",
    },
  ];
  late final PageController pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).Offers,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkMode
                      ? Color(0xFFffffff)
                      : Color(0xFF000000),
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                S.of(context).view_all,
                style: TextStyle(
                  fontSize: 18.0,
                  color: themeProvider.isDarkMode
                      ? Color(0xFFffffff)
                      : Color(0xFF000000).withOpacity(0.7),
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Column(
          children: [
            SizedBox(
              height: kIsWeb ? 550 : 250,
              child: kIsWeb
                  ? ListView.builder(
                      itemCount: resturants.length,
                      itemBuilder: (_, index) {
                        final restaurant = resturants[index];
                        return AnimatedBuilder(
                          animation: pageController,
                          builder: (ctx, child) {
                            return child!;
                          },
                          child: GestureDetector(
                            onTap: () {
                              if (restaurant["id"] == 1) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => offer1main()));
                              } else if (restaurant["id"] == 2) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => offer2main()));
                              } else if (restaurant["id"] == 3) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => offer3main()));
                              } else if (restaurant["id"] == 4) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => offer4main()));
                              }
                            },
                            child: Card(
                              margin: EdgeInsets.only(
                                right: kIsWeb ? 200 : 8,
                                left: kIsWeb ? 200 : 4,
                                bottom: 12,
                                top: 8,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0)),
                              elevation: 1, // Card elevation (shadow)
                              color: Colors.white,
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24.0),
                                      topRight: Radius.circular(24.0),
                                    ),
                                    child: Image.asset(
                                      restaurant["image"],
                                      height: kIsWeb
                                          ? 350
                                          : 150, // Adjust the height as needed
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(restaurant["name"],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    subtitle: Text(restaurant["description"],
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : PageView.builder(
                      controller: pageController,
                      itemBuilder: (_, index) {
                        final restaurant = resturants[index];
                        return AnimatedBuilder(
                          animation: pageController,
                          builder: (ctx, child) {
                            return child!;
                          },
                          child: GestureDetector(
                            onTap: () {
                              if (restaurant["id"] == 1) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => offer1main()));
                              } else if (restaurant["id"] == 2) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => offer2main()));
                              } else if (restaurant["id"] == 3) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => offer3main()));
                              } else if (restaurant["id"] == 4) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => offer4main()));
                              }
                            },
                            child: Card(
                              margin: EdgeInsets.only(
                                right: 8,
                                left: 4,
                                bottom: 12,
                                top: 8,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0)),
                              elevation: 1, // Card elevation (shadow)
                              color: Colors.white,
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24.0),
                                      topRight: Radius.circular(24.0),
                                    ),
                                    child: Image.asset(
                                      restaurant["image"],
                                      height:
                                          150, // Adjust the height as needed
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(restaurant["name"],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    subtitle: Text(restaurant["description"],
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: resturants.length,
                    ),
            )
          ],
        )
      ],
    );
  }
}

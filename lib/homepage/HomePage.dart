import 'package:flutter/material.dart';
import 'package:flutter_project_1st/homepage/CategoriesSection.dart';
import 'package:flutter_project_1st/homepage/Custom_search_field.dart';
import 'package:flutter_project_1st/homepage/ResturantsSection.dart';
import 'package:flutter_project_1st/settingpage/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    double containerWidth = MediaQuery.of(context).size.width * 0.93;
    double containerHeight = MediaQuery.of(context).size.height * 0.18;
    double containerWidthWeb = MediaQuery.of(context).size.width * 0.98;
    double containerHeightWeb = MediaQuery.of(context).size.height * 0.5;
    return Scaffold(
      backgroundColor:
          themeProvider.isDarkMode ? Colors.black54 : Color(0xFFffffff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      image: AssetImage('assets/UNITRADE2.png'),
                      width: kIsWeb ? containerWidthWeb : containerWidth,
                      height: kIsWeb ? containerHeightWeb : containerHeight,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SearchTextField(
                    controller: _searchController,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            CategoriesSection(),
            const ResturantsSection(),
          ],
        ),
      ),
    );
  }
}

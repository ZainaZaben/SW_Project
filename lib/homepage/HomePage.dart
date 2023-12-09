import 'package:flutter/material.dart';
import 'package:flutter_project_1st/homepage/CategoriesSection.dart';
import 'package:flutter_project_1st/homepage/Custom_search_field.dart';
import 'package:flutter_project_1st/homepage/ResturantsSection.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 70,
                                width: 250,
                                decoration: const BoxDecoration(
                                    color: Color(0xFFffffff),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(24),
                                        topRight: Radius.circular(24),
                                        topLeft: Radius.circular(24),
                                        bottomLeft: Radius.circular(24))),
                                child: Text(
                                  "Sell Your Unwanted Items",
                                  style: TextStyle(
                                      color: const Color(0xFF117a5d)
                                          .withOpacity(0.8),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xFF117a5d)
                                        .withOpacity(0.8),
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12))),
                                child: const Text(
                                  " Within Your University Community  ",
                                  style: TextStyle(
                                    color: Color(0xFFffffff),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Image(
                              image: AssetImage('assets/deal_icon.png')),
                        ],
                      )),
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

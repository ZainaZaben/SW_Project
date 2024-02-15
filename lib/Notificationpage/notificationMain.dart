import 'package:flutter/material.dart';
import 'package:flutter_project_1st/settingpage/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'CustomPaymentNotification.dart';
import 'CustomReserveNotfication.dart';
import 'CustomResultNotification.dart';
import 'appBarNotification.dart';
import 'notification_firebase.dart';

class NotificationMain extends StatefulWidget {
  const NotificationMain({
    Key? key,
    required this.reservedArray,
    required this.resultReservedArray,
    required this.title,
    required this.paymentArray,
    required this.fromUserprofiel,
  }) : super(key: key);
  final List<Map<String, dynamic>> reservedArray;
  final List<Map<String, dynamic>> resultReservedArray;
  final List<Map<String, dynamic>> paymentArray;
  final String title;
  final bool fromUserprofiel;

  @override
  State<NotificationMain> createState() => _NotificationMainState();
}

class _NotificationMainState extends State<NotificationMain> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    print("0000000000000000000000000000");
    print(widget.paymentArray.length);
    int countmax = widget.reservedArray.length +
        widget.resultReservedArray.length +
        widget.paymentArray.length;
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            themeProvider.isDarkMode ? Colors.black12 : Color(0xFFffffff),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: appBarNotification(
            title: widget.title,
            fromUserprofiel: widget.fromUserprofiel,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IconButton(
              //     onPressed: () async {
              //       await FirebaseApi().initNotifications();
              //     },
              //     icon: Icon(Icons.check)),
              Expanded(
                child: ListView.builder(
                  itemCount: countmax,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        if (index < widget.reservedArray.length) ...[
                          CustomReserveNotfication(
                            useriamge: widget.reservedArray[index]
                                ['profileimage'],
                            fName: widget.reservedArray[index]['fname'],
                            lName: widget.reservedArray[index]['lname'],
                            itemTitle: widget.reservedArray[index]['title'],
                            itemId: widget.reservedArray[index]['iditem']
                                .toString(),
                            itemRequester: widget.reservedArray[index]
                                    ['itemRequester']
                                .toString(),
                            onDecisionMade: (itemId, itemRequester) {
                              setState(() {
                                widget.reservedArray.removeWhere((item) =>
                                    item['iditem'].toString() == itemId &&
                                    item['itemRequester'].toString() ==
                                        itemRequester);
                              });
                            },
                            themeProvider: themeProvider,
                          ),
                          SizedBox(height: 5),
                          Divider(),
                          SizedBox(height: 10),
                        ],
                        if (index < widget.resultReservedArray.length) ...[
                          CustomResultNotification(
                            useriamge: widget.resultReservedArray[index]
                                ['profileimage'],
                            fName: widget.resultReservedArray[index]['fname'],
                            lName: widget.resultReservedArray[index]['lname'],
                            itemTitle: widget.resultReservedArray[index]
                                ['title'],
                            itemId: widget.resultReservedArray[index]['iditem']
                                .toString(),
                            itemOwner: widget.resultReservedArray[index]
                                    ['itemOwner']
                                .toString(),
                            desicion: widget.resultReservedArray[index]
                                    ['decision']
                                .toString(),
                            themeProvider: themeProvider,
                            price: widget.resultReservedArray[index]['price']
                                .toString(),
                          ),
                          SizedBox(height: 5),
                          Divider(),
                          SizedBox(height: 10),
                        ],
                        if (index < widget.paymentArray.length) ...[
                          CustomPaymentNotfication(
                            useriamge: widget.paymentArray[index]
                                ['profileimage'],
                            fName: widget.paymentArray[index]['fname'],
                            lName: widget.paymentArray[index]['lname'],
                            sellerId: widget.paymentArray[index]['sellerId']
                                .toString(),
                            itemId:
                                widget.paymentArray[index]['itemId'].toString(),
                            themeProvider: themeProvider,
                            ismeal:
                                widget.paymentArray[index]['ismeal'].toString(),
                            mealname: widget.paymentArray[index]['mealname'],
                          ),
                          SizedBox(height: 5),
                          Divider(),
                          SizedBox(height: 10),
                        ],
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

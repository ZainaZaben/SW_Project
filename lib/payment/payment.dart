import 'package:flutter/material.dart';
import 'package:flutter_project_1st/Notificationpage/CustomAlertConten.dart';
import 'package:flutter_project_1st/Notificationpage/appBarNotification.dart';
import 'package:flutter_project_1st/generated/l10n.dart';
import 'package:flutter_project_1st/homepage/hidden_drawer.dart';
import 'package:flutter_project_1st/ipaddress.dart';
import 'package:flutter_project_1st/payment/defaultButton.dart';
import 'package:flutter_project_1st/payment/creditcard.dart';
import 'package:flutter_project_1st/payment/success.dart';
import 'package:flutter_project_1st/registerID.dart';
import 'package:flutter_project_1st/settingpage/theme/theme_provider.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen(
      {Key? key,
      required this.price,
      required this.itemname,
      required this.itemId,
      required this.RegisterID,
      required this.ismeal})
      : super(key: key);
  final String price;
  final String itemname;
  final String itemId;
  final String RegisterID;
  final String ismeal;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int? value = 0;
  final PaymentLabels = [
    Intl.getCurrentLocale() == 'ar'
        ? 'بطاقة الائتمان / بطاقة الخصم'
        : 'Credit card / Debit card',
    Intl.getCurrentLocale() == 'ar' ? 'الدفع عند الاستلام' : 'Cash on delivery',
    Intl.getCurrentLocale() == 'ar' ? 'باي بال' : 'Paypal',
    Intl.getCurrentLocale() == 'ar' ? 'محفظة جوجل' : 'Google wallet',
  ];
  final PaymentIcons = [
    Icons.credit_card,
    Icons.money_off,
    Icons.payment,
    Icons.account_balance_wallet,
  ];

  String registerID = '';
  int success = 0;

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    try {
      final userData = Provider.of<UserData>(context, listen: false);
      registerID = userData.registerID;

      // ignore: unnecessary_null_comparison
      if (registerID != null) {
        print("inside initializeData");
        print(registerID);
      } else {
        // Handle the case where registerID is null
        print('RegisterID is null.');
      }
    } catch (error) {
      // Handle errors
      print('Error initializing data: $error');
    }
  }

  Future<void> addSeeNotification({
    required String iditem,
    required int seeNotif,
    required String itemReqester,
  }) async {
    final ipAddress = await getLocalIPv4Address();
    final url = Uri.parse('http://$ipAddress:3000/addSeeNotif');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'iditem': iditem,
          'seeNotification': seeNotif.toString(),
          'itemRequester': itemReqester
        },
      );

      if (response.statusCode == 200) {
        // Data sent successfully
        print('Reserved successfully');
      } else if (response.statusCode == 400) {
        print("400 error");
      } else {
        print('HTTP error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or other errors
      print('Error: $error');
    }
  }

  Future<void> UpdateSaleCounter({
    required String registerID,
  }) async {
    final ipAddress = await getLocalIPv4Address();
    final url = Uri.parse('http://$ipAddress:3000/updateSale');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {'registerID': registerID},
      );

      if (response.statusCode == 200) {
        // Data sent successfully
        print('SaleCounter updated successfully');
      } else if (response.statusCode == 400) {
        print("400 error");
      } else {
        print('HTTP error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or other errors
      print('Error: $error');
    }
  }

  Future<void> addPayment({
    required String sellerId,
    required String purchaserId,
    required String pay,
    required String itemId,
    required String ismeal,
  }) async {
    final ipAddress = await getLocalIPv4Address();
    final url = Uri.parse('http://$ipAddress:3000/addPayment');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'sellerId': sellerId,
          'purchaserId': purchaserId,
          'payDone': pay,
          'itemId': itemId,
          'ismeal': ismeal
        },
      );

      if (response.statusCode == 200) {
        print('HTTP successful: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or other errors
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: appBarNotification(
          title: S.of(context).payment,
          fromUserprofiel: false,
        ),
      ),
      backgroundColor: themeProvider.isDarkMode
          ? Color.fromARGB(255, 37, 37, 37).withOpacity(0.3)
          : Color(0xFFffffff),
      body: Column(
        children: [
          SizedBox(height: 40),
          Expanded(
            child: ListView.separated(
              itemCount: PaymentLabels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                    activeColor: Color(0xFF117a5d).withOpacity(0.7),
                    value: index,
                    groupValue: value,
                    onChanged: (i) => setState(() => value = i),
                  ),
                  title: Text(
                    PaymentLabels[index],
                    style: TextStyle(
                        color: themeProvider.isDarkMode
                            ? Colors.white
                            : Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  trailing: Icon(
                    PaymentIcons[index],
                    color: Color(0xFF117a5d),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey.shade300,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: DefaultButton(
              btnText: S.of(context).Pay,
              onPressed: () {
                switch (value) {
                  case 0: // Credit card selected
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                child: Text(
                                  S.of(context).delivery_cost,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 16),
                              CustomAlertContent(
                                alertText: S.of(context).delivery_cost_descrp,
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context); // Close Dialog
                                      },
                                      child: Text(
                                        S.of(context).Cancel,
                                        style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Center(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context); // Close Dialog
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CreditCardScreen(
                                                    itemId: widget.itemId,
                                                    registerID:
                                                        widget.RegisterID,
                                                    ismeal: widget.ismeal),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        S.of(context).Next,
                                        style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );

                    break;
                  case 1: // Cash on delivery selected
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            S.of(context).Cash_delivery,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: Text(
                            S.of(context).cash_msg,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                          actions: <Widget>[
                            Center(
                              child: TextButton(
                                onPressed: () async {
                                  await addSeeNotification(
                                      seeNotif: 1,
                                      iditem: widget.itemId.toString(),
                                      itemReqester: registerID);
                                  await UpdateSaleCounter(
                                      registerID: widget.RegisterID);
                                  await addPayment(
                                      sellerId: widget.RegisterID,
                                      purchaserId: registerID,
                                      itemId: widget.itemId,
                                      pay: "1",
                                      ismeal: widget.ismeal);
                                  Navigator.pop(context);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HiddenDrawer(
                                              page: 0,
                                            )),
                                  );
                                },
                                child: Text(
                                  S.of(context).confirm,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                    break;
                  case 2: // Paypal selected
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            S.of(context).Paypal,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          content: Text(
                            S.of(context).paypal_msg,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                          actions: <Widget>[
                            Center(
                              child: TextButton(
                                onPressed: () async {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        PaypalCheckout(
                                      sandboxMode: true,
                                      clientId:
                                          "ATVcaW1rB8zTpuPyT_5-r6U9lRDnuWNZ9_YMLnJ72Ja8qn5WooMbq1ApzDWZAFS0Umh0S4W2OQCasV_X",
                                      secretKey:
                                          "ELPJQdIe3uXYPeIM99iZOsNPB56TBtB9TCyP9gdEJZpYnK2gMEFuh2q3n3T8hL_9Y93qVm4pUDTNJpxg",
                                      returnURL: "success.snippetcoder.com",
                                      cancelURL: "cancel.snippetcoder.com",
                                      transactions: [
                                        {
                                          "amount": {
                                            "total": widget.price,
                                            "currency": "ILS",
                                            "details": {
                                              "subtotal": widget.price,
                                              "shipping": '7',
                                              "shipping_discount": 0
                                            }
                                          },
                                          "description":
                                              "The payment transaction description.",
                                          "item_list": {
                                            "items": [
                                              {
                                                "name": widget.itemname,
                                                "quantity": 1,
                                                "price": widget.price,
                                                "currency": "ILS"
                                              },
                                            ],
                                          }
                                        }
                                      ],
                                      note:
                                          "Contact us for any questions on your order.",
                                      onSuccess: (Map params) async {
                                        setState(() {
                                          success = 1;
                                        });
                                        print(
                                            "***************success: $success");
                                        print(
                                            "==================================onSuccess: $params");
                                      },
                                      onError: (error) {
                                        print("onError: $error");
                                        Navigator.pop(context);
                                      },
                                      onCancel: () {
                                        print("====================cancled");
                                      },
                                    ),
                                  ));
                                },
                                child: Text(
                                  S.of(context).Checkout,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () async {
                                  if (success == 1) {
                                    await addSeeNotification(
                                        seeNotif: 1,
                                        iditem: widget.itemId.toString(),
                                        itemReqester: registerID);
                                    await UpdateSaleCounter(
                                        registerID: widget.RegisterID);
                                    await addPayment(
                                        sellerId: widget.RegisterID,
                                        purchaserId: registerID,
                                        itemId: widget.itemId,
                                        pay: "1",
                                        ismeal: widget.ismeal);
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SuccessScreen(
                                              ispayFromSlides: false,
                                              pdfFilePath: ""),
                                        ));
                                  }
                                },
                                child: Text(
                                  S.of(context).Finish,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );

                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => PaypalScreen(
                    //         price: widget.price,
                    //         itemname:
                    //             widget.itemname), // Navigate to PaypalPage
                    //   ),
                    // );
                    break;
                  // case 3: // Google wallet selected
                  //   Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //       builder: (context) =>
                  //          GoogleWalletScreen(), // Navigate to GoogleWalletPage
                  //     ),
                  //   );
                  //   break;
                }
              },
              widthFactor: 0,
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

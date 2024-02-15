import 'package:flutter/material.dart';
import 'package:flutter_project_1st/Notificationpage/appBarNotification.dart';
import 'package:flutter_project_1st/generated/l10n.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_credit_card/src/credit_card_form.dart';
import 'package:flutter_credit_card/src/models/credit_card_model.dart';
import 'package:flutter_project_1st/ipaddress.dart';
import 'package:flutter_project_1st/payment/success.dart';
import 'package:flutter_project_1st/registerID.dart';
import 'package:flutter_project_1st/settingpage/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen(
      {Key? key,
      required this.itemId,
      required this.registerID,
      required this.ismeal})
      : super(key: key);
  final String itemId;
  final String registerID;
  final String ismeal;

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  int selectedIconIndex = -1;
  bool isCvvFocused = false;
  Color colorIcon = Colors.black54;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String registerID = '';

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

  Future<void> addPayment(
      {required String sellerId,
      required String purchaserId,
      required String pay,
      required String itemId,
      required String ismeal}) async {
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
      backgroundColor: themeProvider.isDarkMode
          ? Color.fromARGB(255, 37, 37, 37).withOpacity(0.3)
          : Colors.grey.shade100,
      //backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: appBarNotification(
          title: S.of(context).Credit_card,
          fromUserprofiel: false,
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            CreditCardWidget(
              customCardTypeIcons: [
                CustomCardTypeIcon(
                  cardType: CardType.unionpay,
                  cardImage: Image.asset(
                    "assets/chip.png",
                    width: 30,
                    height: 30,
                  ),
                ),
                CustomCardTypeIcon(
                  cardType: CardType.otherBrand,
                  cardImage: Image.asset(
                    "assets/mastercard.png",
                    width: 40,
                    height: 40,
                  ),
                )
              ],
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              cardBgColor: Colors.black87,
              onCreditCardWidgetChange: (CreditCardBrand cardBrand) {
                // Handle changes in the credit card widget (if needed)
              },
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  CreditCardForm(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    onCreditCardModelChange: onCreditCardModelChange,
                    formKey: formKey,
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: Color(0xFF117a5d).withOpacity(0.7)),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          print('valid');
                          await addSeeNotification(
                              seeNotif: 1,
                              iditem: widget.itemId.toString(),
                              itemReqester: registerID);
                          await UpdateSaleCounter(
                              registerID: widget.registerID);
                          await addPayment(
                              sellerId: widget.registerID,
                              purchaserId: registerID,
                              itemId: widget.itemId,
                              pay: "1",
                              ismeal: widget.ismeal);

                          // show();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SuccessScreen(
                                  ispayFromSlides: false,
                                  pdfFilePath: "",
                                ),
                              ));
                        } else {
                          print('invalid');
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        child: Text(
                          S.of(context).validate,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}

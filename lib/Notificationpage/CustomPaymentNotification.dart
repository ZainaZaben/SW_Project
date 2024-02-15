import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project_1st/accountpaage/otherUserAccount.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class CustomPaymentNotfication extends StatefulWidget {
  const CustomPaymentNotfication(
      {super.key,
      required this.useriamge,
      required this.fName,
      required this.lName,
      required this.themeProvider,
      required this.sellerId,
      required this.itemId,
      required this.mealname,
      required this.ismeal});
  final String useriamge;
  final String fName;
  final String lName;
  final String sellerId;
  final String itemId;
  final themeProvider;
  final String mealname;
  final String ismeal;

  @override
  State<CustomPaymentNotfication> createState() =>
      _CustomPaymentNotficationState();
}

class _CustomPaymentNotficationState extends State<CustomPaymentNotfication> {
  String idmeal = "0";

  @override
  Widget build(BuildContext context) {
    print(":::::::::::**************");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFF117a5d).withOpacity(0.5),
              child: ClipOval(
                child: kIsWeb
                    ? Image.network(
                        widget.useriamge,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ):Image.file(
                  File(widget.useriamge),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    if (widget.ismeal == "1") {
                      idmeal = widget.itemId;
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => otherUserAccountPage(
                                  userRegisterID: widget.sellerId,
                                  flagReserved: false,
                                  flagReservedResult: false,
                                  flagpayment: true,
                                  itemTitle: '',
                                  itemId: widget.itemId,
                                  goNotification: true,
                                  desicion: false,
                                  price: '',
                                  idmeal: idmeal,
                                )));
                  },
                  child: Container(
                    width: 300,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16,
                          //color: Colors.black87,
                          color: widget.themeProvider.isDarkMode
                              ? Color(0xFFffffff)
                              : Colors.black87,
                        ),
                        children: [
                          TextSpan(
                            text:
                                ("Payment Successful, please click to give your feedback for "),
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: widget.ismeal != "1"
                                ? widget.fName + " " + widget.lName + "."
                                : widget.mealname + " meal.",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

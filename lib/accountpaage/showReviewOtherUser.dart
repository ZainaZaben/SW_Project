import 'package:flutter/material.dart';

class showReivew extends StatefulWidget {
  const showReivew({super.key});

  @override
  State<showReivew> createState() => _showReivewState();
}

class _showReivewState extends State<showReivew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }



  void showReview(String review_userID) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Dialog(
              child: Stack(
                children: [
                  Container(
                      width: 350,
                      height: 480,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Reviews"),
                            Row(
                              children: [
                                CircleAvatar(
                                    radius: 20,
                                    backgroundImage:
                                        AssetImage("assets/chats/Jason.jpg")),
                                SizedBox(
                                  width: 15,
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Duha" + " " + "Salameh",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.sentiment_very_dissatisfied,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                          Icon(
                                            Icons.sentiment_dissatisfied,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                          Icon(
                                            Icons.sentiment_neutral,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                          const Icon(
                                            Icons.sentiment_satisfied,
                                            color: Color(0xFFBFA100),
                                            size: 28,
                                          ),
                                          Icon(
                                            Icons.sentiment_very_satisfied,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 220,
                                        child: Text(
                                          "I have received my Arduino and it's Good. Thank you!!",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              color: Colors.black54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                    radius: 20,
                                    backgroundImage:
                                        AssetImage("assets/chats/Jason.jpg")),
                                SizedBox(
                                  width: 15,
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Duha" + " " + "Salameh",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.sentiment_very_dissatisfied,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                          Icon(
                                            Icons.sentiment_dissatisfied,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                          Icon(
                                            Icons.sentiment_neutral,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                          const Icon(
                                            Icons.sentiment_satisfied,
                                            color: Color(0xFFBFA100),
                                            size: 28,
                                          ),
                                          Icon(
                                            Icons.sentiment_very_satisfied,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 220,
                                        child: Text(
                                          "I have received my Arduino and it's Good. Thank you!!",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              color: Colors.black54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                    radius: 20,
                                    backgroundImage:
                                        AssetImage("assets/chats/Jason.jpg")),
                                SizedBox(
                                  width: 15,
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Duha" + " " + "Salameh",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.sentiment_very_dissatisfied,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                          Icon(
                                            Icons.sentiment_dissatisfied,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                          Icon(
                                            Icons.sentiment_neutral,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                          const Icon(
                                            Icons.sentiment_satisfied,
                                            color: Color(0xFFBFA100),
                                            size: 28,
                                          ),
                                          Icon(
                                            Icons.sentiment_very_satisfied,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 220,
                                        child: Text(
                                          "I have received my Arduino and it's Good. Thank you!!",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              color: Colors.black54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                    radius: 20,
                                    backgroundImage:
                                        AssetImage("assets/chats/Jason.jpg")),
                                SizedBox(
                                  width: 15,
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Duha" + " " + "Salameh",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.sentiment_very_dissatisfied,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                          Icon(
                                            Icons.sentiment_dissatisfied,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                          Icon(
                                            Icons.sentiment_neutral,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                          const Icon(
                                            Icons.sentiment_satisfied,
                                            color: Color(0xFFBFA100),
                                            size: 28,
                                          ),
                                          Icon(
                                            Icons.sentiment_very_satisfied,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 220,
                                        child: Text(
                                          "I have received my Arduino and it's Good. Thank you!!",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              color: Colors.black54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                    radius: 20,
                                    backgroundImage:
                                        AssetImage("assets/chats/Jason.jpg")),
                                SizedBox(
                                  width: 15,
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Duha" + " " + "Salameh",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.sentiment_very_dissatisfied,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                          Icon(
                                            Icons.sentiment_dissatisfied,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                          Icon(
                                            Icons.sentiment_neutral,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                          const Icon(
                                            Icons.sentiment_satisfied,
                                            color: Color(0xFFBFA100),
                                            size: 28,
                                          ),
                                          Icon(
                                            Icons.sentiment_very_satisfied,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 220,
                                        child: Text(
                                          "I have received my Arduino and it's Good. Thank you!!",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              color: Colors.black54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                    radius: 20,
                                    backgroundImage:
                                        AssetImage("assets/chats/Jason.jpg")),
                                SizedBox(
                                  width: 15,
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Duha" + " " + "Salameh",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.sentiment_very_dissatisfied,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                          Icon(
                                            Icons.sentiment_dissatisfied,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                          Icon(
                                            Icons.sentiment_neutral,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                          const Icon(
                                            Icons.sentiment_satisfied,
                                            color: Color(0xFFBFA100),
                                            size: 28,
                                          ),
                                          Icon(
                                            Icons.sentiment_very_satisfied,
                                            color: Colors.black54,
                                            size: 28,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 220,
                                        child: Text(
                                          "I have received my Arduino and it's Good. Thank you!!",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              color: Colors.black54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog.
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

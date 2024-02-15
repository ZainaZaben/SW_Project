import 'package:flutter/material.dart';
import 'package:flutter_project_1st/generated/l10n.dart';
import 'package:flutter_project_1st/settingpage/theme/theme_provider.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:provider/provider.dart';

class chatbot extends StatefulWidget {
  const chatbot({super.key});

  @override
  State<chatbot> createState() => _chatbotState();
}

class _chatbotState extends State<chatbot> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        backgroundColor:
            themeProvider.isDarkMode ? Colors.black87 : Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: GestureDetector(
                  onTap: () async {
                    try {
                      String botId = 'unitrade-2hzgw';
                      dynamic conversationObject = {
                        'appId': '3751698d9f319acb7be63314811021de4',
                        'botIds': [botId],
                      };
                      dynamic result =
                          await KommunicateFlutterPlugin.buildConversation(
                              conversationObject);
                      print("Conversation builder success : " +
                          result.toString());
                    } on Exception catch (e) {
                      print("Conversation builder error occurred : " +
                          e.toString());
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: themeProvider.isDarkMode
                          ? Colors.black45
                          : Colors.grey[300],
                    ),
                    child: Text(
                      S.of(context).click_to_start,
                      style: TextStyle(
                          color: themeProvider.isDarkMode
                              ? Colors.white
                              : Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

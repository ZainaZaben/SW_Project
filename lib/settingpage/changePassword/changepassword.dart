import 'package:flutter/material.dart';
import 'package:flutter_project_1st/Notificationpage/appBarNotification.dart';
import 'package:flutter_project_1st/generated/l10n.dart';
import 'package:flutter_project_1st/ipaddress.dart';
import 'package:flutter_project_1st/registerID.dart';
import 'package:flutter_project_1st/settingpage/settingspage.dart';
import 'package:flutter_project_1st/settingpage/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'CustomNewPassword.dart';
import 'CustomconfirmNewPassword.dart';
import 'customCurrentPassword.dart';
import 'package:http/http.dart' as http;

class changepassword extends StatefulWidget {
  const changepassword({super.key});

  @override
  State<changepassword> createState() => _changepasswordState();
}

class _changepasswordState extends State<changepassword> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context, listen: false);
    final registerID = userData.registerID;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode
          ? Color.fromARGB(255, 37, 37, 37).withOpacity(0.3)
          : Color(0xFFffffff),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: appBarNotification(
          title: S.of(context).change_password,
          fromUserprofiel: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CurrentPasswordTextField(
                controller: currentPasswordController,
              ),
              SizedBox(
                height: 30,
              ),
              NewPasswordTextField(
                controller: newPasswordController,
              ),
              SizedBox(
                height: 30,
              ),
              ConfirmNewPasswordTextField(
                controller: confirmPasswordController,
                controllerpass: newPasswordController,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                errorMessage,
                style: TextStyle(
                  color: Color(0xFFf25a46),
                  fontSize: 16,
                  backgroundColor: Color.fromARGB(255, 240, 192, 186),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFF117a5d),
                ),
                child: TextButton(
                  onPressed: () async {
                    // Validate the form
                    if (_formKey.currentState!.validate()) {
                      print("inside password change");
                      await changePassword(
                          registerID: registerID,
                          password: currentPasswordController.text,
                          newpassword: newPasswordController.text);
                    }
                  },
                  child: Center(
                    child: Text(
                      S.of(context).change_password,
                      style: TextStyle(
                        color: Color(0xFFffffff),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> changePassword({
    required String registerID,
    required String password,
    required String newpassword,
  }) async {
    final ipAddress = await getLocalIPv4Address();
    final url = Uri.parse('http://$ipAddress:3000/changepassword');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'registerID': registerID,
          'password': password,
          'newPassword': newpassword,
        },
      );

      if (response.statusCode == 200) {
        // Data sent successfully
        print('change successful');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Password Changed',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),
              content: Text(
                'Your password has been changed successfully.',
                style: TextStyle(color: Colors.black, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.of(context).pop();
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => settingPage()),
                    // );
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          },
        );
      } else {
        // Handle errors or server response based on status code
        setState(() {
          errorMessage = 'Current password not correct.';
        });
        print('HTTP error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or other errors
      print('Error: $error');
    }
  }
}

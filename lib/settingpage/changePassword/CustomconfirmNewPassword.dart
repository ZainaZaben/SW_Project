import 'package:flutter/material.dart';
import 'package:flutter_project_1st/generated/l10n.dart';

class ConfirmNewPasswordTextField extends StatefulWidget {
  const ConfirmNewPasswordTextField(
      {Key? key, required this.controller, required this.controllerpass})
      : super(key: key);
  // final String passwordText;
  final TextEditingController controller;
  final TextEditingController controllerpass;
  @override
  State<ConfirmNewPasswordTextField> createState() =>
      _ConfirmNewPasswordTextFieldState();
}

class _ConfirmNewPasswordTextFieldState
    extends State<ConfirmNewPasswordTextField> {
  var obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: widget.controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: S.of(context).confirm_new_password,

          contentPadding: EdgeInsets.all(18),
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: obscureText
                  ? Icon(
                      Icons.visibility_off,
                      color: Colors.grey,
                    )
                  : Icon(
                      Icons.visibility,
                      color: Color(0xFF228559),
                    )),
          filled: true,
          fillColor: Color(0xFFc0edda), // Background color
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), // Rounded border
              borderSide: BorderSide.none),
          hintStyle: TextStyle(fontSize: 16, color: Color(0xFF7d7d7d)),
        ),
        style: TextStyle(fontSize: 20, color: Color(0xFF000000)),
        validator: (value) {
          print("value:****** " + value.toString());
          if (value!.isEmpty) {
            return 'Please Enter Confirm New Password';
          }
          if (value != widget.controllerpass.text) {
            print(
                "outputtt:***********" + widget.controllerpass.text.toString());
            return 'Password Must be Same';
          }
          // if (value != widget.passwordText) {
          //   print("outputtt:***********" + widget.passwordText.toString());
          //   return 'Password Must be Same';
          // }

          return null;
        },
      ),
    );
  }
}

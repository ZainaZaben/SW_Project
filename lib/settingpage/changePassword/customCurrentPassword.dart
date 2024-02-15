import 'package:flutter/material.dart';
import 'package:flutter_project_1st/generated/l10n.dart';

class CurrentPasswordTextField extends StatefulWidget {
  const CurrentPasswordTextField({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;

  @override
  State<CurrentPasswordTextField> createState() =>
      _currentPasswordControllerState();
}

class _currentPasswordControllerState extends State<CurrentPasswordTextField> {
  var obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: widget.controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: S.of(context).enter_current_password,

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
          if (value!.isEmpty) {
            return 'Please Enter your Current Password';
          }
          return null;
        },
      ),
    );
  }
}

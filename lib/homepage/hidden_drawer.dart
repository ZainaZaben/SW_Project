import 'package:flutter/material.dart';
import 'package:flutter_project_1st/getStarted.dart';
import 'package:flutter_project_1st/helpPage/help.dart';
import 'package:flutter_project_1st/homepage/mainpage.dart';
import 'package:flutter_project_1st/log_sign_forgot/loginpage.dart';
import 'package:flutter_project_1st/settingpage/settingspage.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "HomePage",
          baseStyle: TextStyle(
              color: Color(0xFFffffff),
              fontWeight: FontWeight.bold,
              fontSize: 18.0),
          selectedStyle: TextStyle(
              color: Color(0xFF117a5d),
              fontWeight: FontWeight.bold,
              fontSize: 18.0),
          colorLineSelected: Color(0xFF117a5d),
        ),
        mainpage(),
      ),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Help",
            baseStyle: TextStyle(
                color: Color(0xFFffffff),
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
            selectedStyle: TextStyle(
              color: Color(0xFF117a5d),
            ),
            colorLineSelected: Color(0xFF117a5d),
          ),
          helpPage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Settings",
            baseStyle: TextStyle(
                color: Color(0xFFffffff),
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
            selectedStyle: TextStyle(
              color: Color(0xFF117a5d),
            ),
            colorLineSelected: Color(0xFF117a5d),
          ),
          settingPage()
          ),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Logout",
            baseStyle: TextStyle(
                color: Color(0xFFffffff),
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
            selectedStyle: TextStyle(
              color: Color(0xFF117a5d),
            ),
            colorLineSelected: Color(0xFF117a5d),
            onTap: () {
              logout();
            },
          ),
          Container()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Color(0xFF117a5d).withOpacity(0.7),
      backgroundColorAppBar: Color(0xFF088054),
      // iconMenuAppBar: Icon(
      //   Icons.menu,
      //   color: Colors.white, // Set the menu icon color to white
      // ),
      screens: _pages,
      //    typeOpen: TypeOpen.FROM_RIGHT,
      //  disableAppBarDefault: false,

      //    enableScaleAnimin: true,
      //    enableCornerAnimin: true,
      slidePercent: 60.0,
      //    verticalScalePercent: 80.0,
      //    contentCornerRadius: 10.0
      //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
      //    whithAutoTittleName: true,
      //styleAutoTittleName: TextStyle(color: Colors.red),
      actionsAppBar: <Widget>[
        IconButton(
          onPressed: () {
            // Handle notification icon press
          },
          icon: Icon(Icons.notifications_active,
              size: 25, color: Color(0xFFffffff)),
        ),
      ],

      //backgroundColorContent: Colors.blue,
      //    elevationAppBar: 4.0,
      tittleAppBar: Center(
        child: Text(
          "U N I T R A D E",
          style: TextStyle(
              color: Color(0xFFffffff),
              fontWeight: FontWeight.bold,
              fontSize: 25.0),
        ),
      ),
      // enableShadowItensMenu: true,
      // backgroundMenu: DecorationImage(
      //     image: ExactAssetImage('assets/page4_remove.png'), fit: BoxFit.cover),
    );
  }

  void logout() {
    // Implement your logout logic here.
    // For example, clear user data and navigate to the login screen.
    // Navigate to the login screen
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => getStarted()));
  }
}

import 'package:flutter_project_1st/widgets/forward_button.dart';
import 'package:flutter_project_1st/widgets/setting_item.dart';
import 'package:flutter_project_1st/widgets/setting_switch.dart';
import 'package:flutter_project_1st/accountpaage/accountpage.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_project_1st/theme/dark_theme.dart';
import 'package:flutter_project_1st/theme/light-theme.dart';
import 'package:flutter_project_1st/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class settingPage extends StatefulWidget {
  const settingPage({super.key});

  @override
  State<settingPage> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<settingPage> {
  bool isDarkMode = false;
 bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Settings",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),

              Container(
                
                padding: EdgeInsets.all(16), // Adjust padding as needed
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary, // Specify the color of the border
                    width: 1, // Adjust the width of the border
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.primary, // Adjust border radius as needed
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Image.asset("assets/ProfileImage.png", width: 70, height: 70),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dana Zaben",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Flutter Software Engineer",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                          Spacer(),

                          MouseRegion(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AccountPage(),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary, // Change color on hover
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Ionicons.chevron_forward,
                                      color: Theme.of(context).colorScheme.surface,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Container(
                //
                padding: EdgeInsets.all(16), // Adjust padding as needed
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary, // Specify the color of the border
                    width: 1, // Adjust the width of the border
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.primary, // Adjust border radius as needed
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //SizedBox(height: 40),
                    Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20),
                    SettingItem(
                      title: "Language",
                      icon: Ionicons.earth,
                      bgColor: Theme.of(context).colorScheme.primary,
                      iconColor: Colors.grey,
                      value: "English",
                      onTap: () {},

                    ),
                    SizedBox(height: 20),
                    SettingItem(
                      title: "Change Password",
                      icon: Ionicons.key,
                      bgColor: Theme.of(context).colorScheme.primary,
                      iconColor: Colors.grey,
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    SettingItem(
                      title: "Notifications",
                      icon: Ionicons.notifications,
                      bgColor: Theme.of(context).colorScheme.primary,
                      iconColor: Colors.grey,
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    SettingSwitch(
                      title: "Dark Mode",
                      icon: Ionicons.earth,
                      bgColor: Theme.of(context).colorScheme.primary,
                      iconColor: Colors.grey,
                      value: isDarkMode,
                      onTap: (value) {
                        isDarkMode = value;
                        Provider.of<ThemeProvider>(context, listen: false)
                      .setTheme(value);
                      },
                    ),
                    const SizedBox(height: 20),
                    SettingItem(
                      title: "Send Feedback",
                      icon: Ionicons.chatbox,
                      bgColor: Theme.of(context).colorScheme.primary,
                      iconColor: Colors.grey,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


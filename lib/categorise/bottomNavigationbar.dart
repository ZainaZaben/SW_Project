import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> bottomNavs = [
      {"icon": Icons.save},
      {"icon": Icons.favorite_border},
      {"icon": Icons.comment},
      {"icon": Icons.send_rounded},
    ];

    return SafeArea(
        child: Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
          color: Color(0xFF117a5d).withOpacity(0.7),
          borderRadius: const BorderRadius.all(Radius.circular(24))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(
            bottomNavs.length,
            (index) => GestureDetector(
              onTap: () {
                // TODO: Play animation on tap
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TODO: Animated Bar
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Opacity(
                      opacity: 1, // TODO: Chnage Opacity if not selected
                      child: Icon(bottomNavs[index]["icon"],
                          color: Color(0xFFffffff), size: 25),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

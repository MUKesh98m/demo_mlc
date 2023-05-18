import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo/common/constants.dart';
import 'package:demo/screens/home_screen.dart';
import 'package:demo/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import '../screens/compiler/complier_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final navKey = GlobalKey();

  var pagesAll = [const HomeScreen(), const CompilerScreen(), const ProfileScreen()];

  var myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeScreenBackgroundColor,
      body: pagesAll[myIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: bottomBarColor,
        key: navKey,
        backgroundColor: Colors.transparent,
        items: <Widget>[
          Icon(myIndex == 0 ? Icons.favorite : Icons.favorite_border,
              size: 30, color: Colors.white),
          const Icon(Icons.home_outlined, size: 30, color: Colors.white),
          const Icon(Icons.person_2, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
      ),
    );
  }
}

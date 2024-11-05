
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottonNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
   MyBottonNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        color: Colors.grey[600],
        activeColor: Colors.grey.shade700,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: "Shop",
            ),
            GButton(
            icon: Icons.shopping_bag_rounded,
            text: "Car",
            ),
            GButton(
            icon: Icons.search,
            text: "Search",
            ),
            GButton(
            icon: Icons.person,
            text: "Profile",
            ),
        ]
        ),
    );
  }
}
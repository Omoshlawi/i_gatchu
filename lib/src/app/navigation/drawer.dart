import 'package:flutter/material.dart';

class DrawerItem {
  final String? section;
  final IconData icon;
  final String title;
  final void Function(BuildContext context)? onPress;

  DrawerItem(this.section, this.icon, this.title, this.onPress);
}

final drawerItems = [
  DrawerItem("section 1", Icons.history, "Orders", (BuildContext context) {}),
  DrawerItem("section 1", Icons.notifications, "Notifications",
      (BuildContext context) {}),
  DrawerItem(
      "section 1", Icons.favorite, "Which list", (BuildContext context) {}),
  DrawerItem(
      "section 1", Icons.settings, "Settings", (BuildContext context) {}),
  DrawerItem("section 1", Icons.logout, "Logout", (BuildContext context) {

  }),
];

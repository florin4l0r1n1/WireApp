import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../screens/chat_screen.dart';
import '../screens/contacts_screen.dart';
import '../screens/settings_screen.dart';

class Navigationbar extends StatelessWidget {
  PersistentTabController _tabController =
      PersistentTabController(initialIndex: 0);

  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarItems(context),
      navBarStyle: NavBarStyle.style3,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  List<Widget> _buildScreens() {
    return [ChatScreen(), ContactsScreen(), Settingsscreen()];
  }

  List<PersistentBottomNavBarItem> _navBarItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(
            Icons.chat_outlined,
          ),
          activeColorPrimary: Theme.of(context).buttonColor),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.map_outlined),
          activeColorPrimary: Theme.of(context).buttonColor),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.settings_applications_outlined),
          activeColorPrimary: Theme.of(context).buttonColor),
    ];
  }
}

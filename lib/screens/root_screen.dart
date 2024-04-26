// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guzo_go_clone/constants/app_constants.dart';
import 'package:guzo_go_clone/screens/screens.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({
    super.key,
  });
  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;
  close() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.white,
    //   statusBarIconBrightness: Brightness.light,
    // ));
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0;
          });
          return false;
        } else {
          SystemNavigator.pop();

          return true;
        }
      },
      child: Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: AppConstants.grey400))),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: AppConstants.primaryColor,
            unselectedItemColor: AppConstants.iconGrey,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            iconSize: 30,
            selectedFontSize: AppConstants.smallFont,
            unselectedFontSize: AppConstants.smallFont,
            onTap: (int index) {
              setState(() => _selectedIndex = index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(icon: Icon(Icons.work), label: "Booking"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: "Notifications"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Setting"),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> screens = [
    const HomeScreen(),
    const BookingScreen(),
    const NotificationScreen(),
    const SettingScreen(),
  ];
}

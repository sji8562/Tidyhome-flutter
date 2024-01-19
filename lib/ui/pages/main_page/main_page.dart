import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/ui/pages/customer_page/customer_main_page/customer_main_page.dart';
import 'package:toyproject/ui/pages/main_page/home/main_home_page.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_list_page/reservation_list_page.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_page/reservation_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            MainHomePage(),
            ReservationListPage(),
            ReservationPage(),
            CustomerMainPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.plus_rectangle), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ],
        ),
      ),
    );
  }
}

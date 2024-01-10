import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/ui/pages/customer_page/customer_page.dart';
import 'package:toyproject/ui/pages/main_page/home/main_home_page.dart';
import 'package:toyproject/ui/pages/reservation_page/list_page.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_page.dart';

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
            CustomerPage(),
        ],),
        bottomNavigationBar:
        BottomNavigationBar(
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
            BottomNavigationBarItem(icon: Icon(Icons.present_to_all_outlined), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ],
        ),
      ),
    );
  }
}

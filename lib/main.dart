import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_page.dart';
import 'package:toyproject/ui/pages/home_page/login.dart';
import 'package:toyproject/ui/pages/splash_page/splash_page.dart';
import '_core/constants/move.dart';
import '_core/constants/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'ui/pages/reservation_page/choice_address_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ChoiceAddressPage()
      home: ReservationPage(),
      // home: const SplashPage(),
      // navigatorKey: navigatorKey,
      // debugShowCheckedModeBanner: false,
      // initialRoute: Move.MainPage,
      // routes: getRouters(),
      // theme: theme(),
    );
  }
}

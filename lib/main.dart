import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/ui/pages/splash_page/splash_page.dart';
import '_core/constants/move.dart';
import '_core/constants/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const SplashPage(),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      // initialRoute: Move.ReservationListPage,
      initialRoute: Move.ReservationListPage,
      routes: getRouters(),
      theme: theme(),
    );
  }
}

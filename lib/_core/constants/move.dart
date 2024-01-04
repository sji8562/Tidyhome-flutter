import 'package:flutter/material.dart';
import 'package:toyproject/ui/pages/splash_page/splash_page.dart';
import '../../ui/pages/start_page/start_page.dart';
import 'package:toyproject/ui/pages/reservation_page/choice_address_page.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_page.dart';


class Move {
  static String StartPage = "/start";
  static String MainPage = "/main";
  static String LoginPage = "/login";
  static String JoinPage = "/join";
  static String JoinSuccessPage = "/join/success";
  static String CategoryListPage = "/category/list";
  static String FindLoginIdPage = "/find/loginid";
  static String FindLoginIdSuccessPage = "/find/loginid/success";
  static String FindPasswordPage = "/find/password";
  static String FindPasswordNewSetPage = "/find/password/set";
  static String CardSavePage = "/card/save";
  static String PayMainPage = "/card";
  static String SplashPage = "/splash";

  // KWON
  static String ReservationPage = "/reservation";
  static String ChoiceAddressPage = '/choice-address';
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.SplashPage: (context) => SplashPage(),
    Move.StartPage: (context) => StartPage(),
    Move.ReservationPage: (context) => ReservationPage(),
    Move.ChoiceAddressPage: (context) => ChoiceAddressPage(),
    // Move.MainPage: (context) => MainPage(),
    // Move.LoginPage: (context) => LoginPage(),
    // Move.JoinPage: (context) => JoinPage(),
    // Move.JoinSuccessPage: (context) => JoinSuccessPage(),
    // Move.CategoryDetailPage: (context) => const CategoryDetailPage(),
    // Move.FindLoginIdPage: (context) => FindLoginIdPage(),
    // Move.FindLoginIdSuccessPage: (context) => const FindLoginIdSuccessPage(),
    // Move.FindPasswordPage: (context) => FindPasswordPage(),
    // Move.FindPasswordNewSetPage: (context) => FindPasswordNewSetPage(),
    // Move.CardSavePage: (context) => PayCardSavePage(),
    // Move.PayMainPage: (context) => const PayMainPage(),
  };
}
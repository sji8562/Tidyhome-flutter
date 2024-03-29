import 'package:flutter/material.dart';
import 'package:toyproject/ui/pages/company_update_info_page/company_update_info_page.dart';
import 'package:toyproject/ui/pages/customer_page/account_closure_page/account_closure_page.dart';
import 'package:toyproject/ui/pages/customer_page/customer_main_page/customer_main_page.dart';
import 'package:toyproject/ui/pages/customer_page/faq_page/faq_page.dart';
import 'package:toyproject/ui/pages/customer_page/live_chat_page/live_chat_page.dart';
import 'package:toyproject/ui/pages/customer_page/notice_page/notice_page.dart';
import 'package:toyproject/ui/pages/customer_page/privacy_policy_page/privacy_policy_page.dart';
import 'package:toyproject/ui/pages/customer_page/sharing_personal_Information_page/terms_and_conditions_page.dart';
import 'package:toyproject/ui/pages/customer_page/term_and_conditions_page/terms_and_conditions_page.dart';
import 'package:toyproject/ui/pages/customer_page/term_of_service_page/terms_of_service_page.dart';
import 'package:toyproject/ui/pages/pay_ment_page/pay_ment_page.dart';
import 'package:toyproject/ui/pages/reservation_page/caution_page/caution_page.dart';
import 'package:toyproject/ui/pages/reservation_page/completed_service_list_page/completed_service_list_page.dart';
import 'package:toyproject/ui/pages/reservation_page/enter_access_methods_page/enter_access_methods_after_page.dart';
import 'package:toyproject/ui/pages/reservation_page/enter_other_requests_page/enter_other_requests_after_page.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_apply_page/office_cleaning_apply_page/office_cleaning_apply_page.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_cancle_page/reservation_cancel_page.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_change_page/reservation_change_page.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_confirm_page/reservation_confirm_page.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_detail_page/reservation_detail_page.dart';
import 'package:toyproject/ui/pages/reservation_page/enter_access_methods_page/enter_access_methods_page.dart';
import 'package:toyproject/ui/pages/reservation_page/enter_other_requests_page/enter_other_requests_page.dart';
import 'package:toyproject/ui/pages/reservation_page/find_address_page/find_address_page.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_list_page/reservation_list_page.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_result_page/result_page.dart';
import 'package:toyproject/ui/pages/service_detail_page/applience_page/applience_page.dart';
import 'package:toyproject/ui/pages/service_detail_page/movement_page/movement_page.dart';
import 'package:toyproject/ui/pages/splash_page/splash_page.dart';
import '../../ui/pages/company_update_info_page/company_update_info_fourth_page.dart';
import '../../ui/pages/company_update_info_page/company_update_info_last_page.dart';
import '../../ui/pages/company_update_info_page/company_update_info_pic_page.dart';
import '../../ui/pages/company_update_info_page/company_update_info_second_page.dart';
import '../../ui/pages/company_update_info_page/company_update_info_thrid_page.dart';
import '../../ui/pages/join_page/join_page.dart';
import '../../ui/pages/main_page/home/main_home_page.dart';
import '../../ui/pages/main_page/main_page.dart';
import '../../ui/pages/reservation_page/reservation_apply_page/home_work_apply_page/home_work_apply_page.dart';
import '../../ui/pages/reservation_page/reservation_apply_page/moving_cleaning_apply_page/moving_cleaning_apply_page.dart';
import '../../ui/pages/service_detail_page/housekeeper_page/housekeeper_page.dart';
import '../../ui/pages/service_detail_page/office_page/office_page.dart';
import '../../ui/pages/start_page/start_page.dart';
import 'package:toyproject/ui/pages/reservation_page/choice_address_page/choice_address_page.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_page/reservation_page.dart';

import '../../ui/pages/test_calendar_page.dart';


class Move {
  static String LoginPage = "/login";
  static String JoinSuccessPage = "/join/success";
  static String CategoryListPage = "/category/list";
  static String FindLoginIdPage = "/find/loginid";
  static String FindLoginIdSuccessPage = "/find/loginid/success";
  static String FindPasswordPage = "/find/password";
  static String FindPasswordNewSetPage = "/find/password/set";
  static String CardSavePage = "/card/save";
  static String PayMainPage = "/card";
  //Jeong
  static String StartPage = "/start";
  static String SplashPage = "/splash";
  static String JoinPage = "/join";
  static String MainPage = "/main";
  static String MainHomePage = "/main/home";
  static String CompanyUpdateInfoPage = "/join/company/update/info";
  static String CompanyUpdateInfoSecondPage = "/join/company/update/second-info";
  static String CompanyUpdateInfoThirdPage = "/join/company/update/third-info";
  static String CompanyUpdateInfoFourthPage = "/join/company/update/fourth-info";
  static String CompanyUpdateInfoLastPage = "/join/company/update/last-info";
  static String CompanyUpdateInfoPicPage = "/join/company/update/pic-info";
  static String HomeWorkApplyPage = "/apply/homeWork";
  static String MovingCleaningApplyPage = "/apply/moving-cleaning";
  static String OfficeCleaningApplyPage = "/apply/office-cleaning";
  static String ReservationChangePage = "/reservation/change";
  static String ReservationCancelPage = "/reservation/cancel";
  static String ReservationConfirmPage = "/reservation/confirm";

  // KWON
  static String ReservationPage = "/reservation";
  static String ChoiceAddressPage = '/choice-address';
  static String FindAddressPage = '/find-address';
  static String HouseKeeperPage = '/housekeeper';
  static String OfficePage = '/office';
  static String MovementPage = '/movement';
  static String AppliencePage = '/applience';
  static String CustomerPage = '/customer';
  static String NoticePage = '/customer/notice';
  static String NoticeDetailPage = '/customer/notice/detail';
  static String AccountClosurePage = '/customer/account-closure';
  static String TermsOfService = '/customer/terms-of-service';
  static String TermsAndConditionsPage = '/customer/terms-of-service/detail';
  static String PrivacyPolicyPage = '/customer/terms-of-service/privacy-policy';
  static String SharingPersonalInformationPage = '/customer/sharing-personal-information';
  static String FaqPage = '/customer/faq';
  static String LiveChatPage = '/customer/live-chat';
  static String ReservationResultPage = '/reservation/result';
  static String ReservationListPage = '/reservation/list';
  static String EnterAccessMethodsPage = '/reservation/access-methods';
  static String EnterAccessMethodsAfterPage = '/reservation/access-methods/after';
  static String EnterOtherRequestsAfterPage = '/reservation/other-requests/after';
  static String EnterOtherRequestsPage = '/reservation/other-requests';
  static String ReservationDetailPage = '/reservation/detail';
  static String CautionPage = '/reservation/caution';
  static String CompletedServiceListPage = '/completed-service-list';
  static String CalendarTestPage = '/test/calendar';
  //Song
  static String PaymentPage = '/payment/';
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    //SONG
    // Move.PaymentPage: (context) => PayMentPage(),
    //JEONG
    Move.SplashPage: (context) => SplashPage(),
    Move.StartPage: (context) => StartPage(),
    Move.JoinPage: (context) => JoinPage(),
    Move.MainPage: (context) => MainPage(),
    Move.MainHomePage: (context) => MainHomePage(),
    Move.CompanyUpdateInfoPage: (context) => CompanyUpdateInfoPage(),
    Move.CompanyUpdateInfoSecondPage: (context) => CompanyUpdateInfoSecondPage(),
    Move.CompanyUpdateInfoThirdPage: (context) => CompanyUpdateInfoThirdPage(),
    Move.CompanyUpdateInfoFourthPage: (context) => CompanyUpdateInfoFourthPage(),
    Move.CompanyUpdateInfoLastPage: (context) => CompanyUpdateInfoLastPage(),
    Move.CompanyUpdateInfoPicPage : (context) => CompanyUpdateInfoPicPage(),
    Move.HomeWorkApplyPage : (context) => HomeWorkApplyPage(),
    Move.MovingCleaningApplyPage : (context) => MovingCleaningApplyPage(),
    Move.OfficeCleaningApplyPage : (context) => OfficeCleaningApplyPage(),
    Move.ReservationChangePage : (context) => ReservationChangePage(),
    Move.ReservationConfirmPage : (context) => ReservationConfirmPage(),
    Move.ReservationCancelPage : (context) => ReservationCancelPage(),
    // KWON
    Move.ChoiceAddressPage: (context) => ChoiceAddressPage(),
    Move.ReservationPage: (context) => ReservationPage(),
    Move.ChoiceAddressPage: (context) => ChoiceAddressPage(),
    Move.FindAddressPage: (context) => FindAddressPage(),
    Move.HouseKeeperPage: (context) => HouseKeeperPage(),
    Move.OfficePage: (context) => OfficePage(),
    Move.MovementPage: (context) => MovementPage(),
    Move.AppliencePage: (context) => AppliencePage(),
    Move.CustomerPage: (context) => CustomerMainPage(),
    Move.NoticePage: (context) => NoticePage(),
    // Move.NoticeDetailPage: (context) => NoticeDetailPage(),
    Move.AccountClosurePage: (context) => AccountClosurePage(),
    Move.TermsOfService: (context) => TermsOfService(),
    Move.TermsAndConditionsPage: (context) => TermsAndConditionsPage(),
    Move.PrivacyPolicyPage: (context) => PrivacyPolicyPage(),
    Move.SharingPersonalInformationPage: (context) => SharingPersonalInformationPage(),
    Move.FaqPage: (context) => FaqPage(),
    Move.LiveChatPage: (context) => LiveChatPage(),
    Move.ReservationResultPage: (context) => ReservationResultPage(),
    Move.ReservationListPage: (context) => ReservationListPage(),
    Move.EnterAccessMethodsPage: (context) => EnterAccessMethodsPage(),
    // Move.EnterAccessMethodsAfterPage: (context) => EnterAccessMethodsAfterPage(),
    Move.EnterOtherRequestsPage: (context) => EnterOtherRequestsPage(),
    // Move.EnterOtherRequestsAfterPage: (context) => EnterOtherRequestsAfterPage(),
    // Move.ReservationDetailPage: (context) => ReservationDetailPage(),
    Move.CautionPage: (context) => CautionPage(),
    Move.CompletedServiceListPage: (context) => CompletedServiceListPage(),
    Move.CalendarTestPage: (context) => CalendarTestPage(),

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
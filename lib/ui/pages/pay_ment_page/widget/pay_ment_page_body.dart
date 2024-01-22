
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iamport_flutter/iamport_payment.dart';
import 'package:iamport_flutter/model/payment_data.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/_core/utils/extract_time_util.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';
import 'package:toyproject/data/store/session_store.dart';
import 'package:toyproject/ui/pages/pay_ment_page/pay_ment_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/choice_address_page/choice_address_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_confirm_page/confrim_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_result_page/result_page_view_model.dart';

import '../../../../_core/constants/move.dart';
import '../../../../data/dto/request_dto/payment/payment_request.dart';
import '../../../../data/repository/payment_repository.dart';
// Import other necessary packages and classes

class PayMentPageBody extends ConsumerWidget {
  final int price;
  final String serviceName;
  final String optionName;
  PayMentPageBody({super.key,required this.price, required this.serviceName, required this.optionName});

  Dio dio = Dio(); // Initialize the Dio instance

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    SessionUser session = ref.read(sessionProvider);


    return IamportPayment(
      appBar: new AppBar(
        title: new Text('결제하기'),
      ),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
      /* [필수입력] 가맹점 식별코드 */
      userCode: 'imp13560515',
      /* [필수입력] 결제 데이터 */
      data: PaymentData(
        pg: 'kakaopay', // PG사
        payMethod: 'card', // 결제수단
        name: serviceName + "(" +optionName + ")", // 주문명
        merchantUid: 'mid_${DateTime.now().millisecondsSinceEpoch}', // 주문번호
        amount: price, // 결제금액
        // buyerName: "${session.user!.tel}", // 구매자 이름
        buyerName: "송재익", // 구매자 이름
        // buyerTel: '${session.user!.tel}', // 구매자 연락처
        buyerTel: '01058288562', // 구매자 연락처
        // buyerEmail: "${session.user!.userEmail}", // 구매자 이메일
        buyerEmail: "whaqlzkem@gmail.com", // 구매자 이메일
        appScheme: 'example', // 앱 URL scheme
      ),
      /* [필수입력] 콜백 함수 */
      callback: (Map<String, String> result) async {
        if (result['imp_success'] == 'true') {
          PaymentRequestDTO requestDTO =
          PaymentRequestDTO(ref.read(choiceAddressProvider.notifier).findFirstAddress()!.id,
              (extractHour(ref.read(resultPageProvider)!.cleaningDate!.soYoTime) / 2).toInt(), ref.read(resultPageProvider)!.cleaningDate!.dateTime,
              ref.read(resultPageProvider)!.cleaningDate!.startToEndTime, ref.read(resultPageProvider)!.cleaningDate!.hasPet,
          ref.read(resultPageProvider)!.howToOpen, ref.read(resultPageProvider)!.doorPassword, ref.read(resultPageProvider)!.carefulETC, ref.read(resultPageProvider)!.requestETC, 2);
          ref.read(paymentProvider.notifier).fetchPayment(requestDTO);
          Logger().d("니가 문제냐?");
          //서버에 실패했다는 alert창 띄우기
        } else {
          //결제에 실패했다는 alert 창 띄우기
          Navigator.pushReplacementNamed(
            context,
            Move.ReservationResultPage,
            arguments: result,
          );
        }
      },
    );
  }
}
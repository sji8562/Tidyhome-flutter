import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/_core/constants/style.dart';
import 'package:toyproject/_core/utils/extract_time_util.dart';
import 'package:toyproject/ui/pages/pay_ment_page/pay_ment_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/choice_address_page/choice_address_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/enter_access_methods_page/enter_access_methods_page.dart';
import 'package:toyproject/ui/pages/reservation_page/enter_access_methods_page/enter_access_methods_after_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_result_page/result_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/image_text_button_with_label.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/reservation_success.dart';
import 'package:toyproject/ui/widget/blue_small_text_button.dart';
import 'package:toyproject/ui/widget/button/color_button_full_width.dart';
import 'package:toyproject/ui/widget/custom_modal/information_modal.dart';
import 'package:toyproject/ui/widget/divider/custom_divider.dart';
import 'package:toyproject/ui/widget/divider/custom_divider_thin.dart';
import 'package:toyproject/ui/widget/exclamationmark_title.dart';
import 'package:toyproject/ui/widget/loading.dart';

class ResultConfirmBody extends ConsumerStatefulWidget {
  const ResultConfirmBody({super.key});

  @override
  ConsumerState<ResultConfirmBody> createState() => _ResultPageBodyState();
}

class _ResultPageBodyState extends ConsumerState<ResultConfirmBody> {


  // 모달을 표시하는 함수
  Future<void> _showFeeRuleModal(BuildContext context, String type) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return InformationModal(type: type);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
   ResultPageModel? resultPageModel = ref.watch(resultPageProvider);
   PaymentPageModel? paymentPageModel = ref.watch(paymentProvider);

   if (resultPageModel == null || paymentPageModel == null){
     const Loading();
   }
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              ReservationSuccess(),

              const CustomDivider(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text('부가정보')
                ),
              ),
              ImageAndTextAndButtonWithLabel(title: '출입방법', icon_name: 'home_icon.PNG',
                  button_text: resultPageModel!.howToOpen != "" ? resultPageModel!.howToOpen : "없음", jColor: resultPageModel!.howToOpen != "" ? primaryColor : basicColorB9,
                  acting: () {
                    Navigator.pushNamed(context, Move.EnterAccessMethodsPage);
                 }
              ),

              CustomDividerThin(),

              ImageAndTextAndButtonWithLabel(title: '기타 요청사항', icon_name: 'message_icon.png',
                  button_text: resultPageModel!.requestETC != "" ? resultPageModel!.requestETC : "없음", jColor: resultPageModel!.requestETC != "" ? primaryColor : basicColorB9,
                  acting: () {
                Navigator.pushNamed(context, Move.EnterOtherRequestsPage); }
              ),

              const CustomDivider(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('청소 일정'),
                      textBody6(paymentPageModel!.reservationResult!.reservationDate),
                      textBody6(extractHoursToString(resultPageModel!.cleaningDate!.soYoTime) + "(" + paymentPageModel!.reservationResult!.reservationTime + ")"),

                      SizedBox(height: 15.0,),

                      Text('내 주소'),
                      textBody6(paymentPageModel!.reservationResult!.address),
                      textBody6(paymentPageModel!.reservationResult!.addressDetail),

                      SizedBox(height: 15.0,),

                      Text('반려동물'),
                      textBody6(paymentPageModel!.reservationResult!.pet ? "있음" : "없음"),
                    ],
                  ),
                ),
              ),

              const CustomDivider(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('결제 정보'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          children: [
                            textBody6('결제 완료 금액'),

                            textBody6(
                                resultPageModel!.cleaningDate!.areaSize > 0 ?
                                "${formatNumberWithComma(extractPrice(resultPageModel!.cleaningDate!.soYoTime) * resultPageModel!.cleaningDate!.areaSize)} 원"
                                    : "${formatNumberWithComma(extractPrice(resultPageModel!.cleaningDate?.soYoTime ?? "0원"))}원")
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                      Text('결제가 완료되었습니다.', style: TextStyle(fontSize: 13, color: disableColor),),
                    ],
                  ),
                ),
              ),
              CustomDividerThin(),
              ImageAndTextAndButtonWithLabel(title: '결제수단', icon_name: 'card_icon.PNG', button_text: '카카오페이', jColor: primaryColor,
                // TODO 출입 방법 페이지로 이동
                // acting: Navigator.pushNamed(context, )
              ),
              CustomDivider(),

              ExclamationmarkTitle(title: '청소 도구를 꼭 준비해주세요.'),

              Image.asset('${Define.images}cleaning_tools_image.PNG'),

              ExclamationmarkTitle(title: '취소/변경시 규정에 따라 수수료가 부과됩니다.'),

              BlueSmalltextButton(text: '수수료 규정 보기', action: () {
                _showFeeRuleModal(context, 'house_keeping_fee_rule');
              }),

              SizedBox(height: 70,),

            ],
          ),
        ),
        Positioned(bottom: 20,
            child: Container(
              // TODO move to 예약 내역
                child: ColorButtonFullWith(text: '확인', action: (){
                  Navigator.pushNamed(context, Move.ReservationListPage);
                })
            )
        ),
      ],
    );
  }
}

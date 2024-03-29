import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/_core/constants/style.dart';
import 'package:toyproject/data/model/reservationDetail.dart';
import 'package:toyproject/ui/pages/reservation_page/enter_access_methods_page/enter_access_methods_after_page.dart';
import 'package:toyproject/ui/pages/reservation_page/enter_other_requests_page/enter_other_requests_after_page.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_cancle_page/reservation_cancel_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_change_page/reservation_change_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_detail_page/reservation_detail_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/icon_text.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/image_text_button.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/image_text_button_with_label.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/text_label.dart';
import 'package:toyproject/ui/widget/button/color_button_full_width.dart';
import 'package:toyproject/ui/widget/custom_modal/information_modal.dart';
import 'package:toyproject/ui/widget/divider/custom_divider.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/divider/custom_divider_thin.dart';
import 'package:toyproject/ui/widget/loading.dart';

class ReservationDetailPage extends ConsumerWidget {
  int id;

  ReservationDetailPage({super.key, required this.id});

  // 모달을 표시하는 함수
  Future<void> _showFeeRuleModal(BuildContext context, String type) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return InformationModal(type: type);
      },
    );
  }
  
  String setStatusName(int id){
    if(id == 1){
      return "예약 대기";
    } else if (id == 2){
      return "예약 완료";
    } else if (id == 3){
      return "서비스 완료";
    } else if (id == 4){
      return "예약 취소";
    }
    return "";
  }
  
  bool setIsActive(int id){
    if(id == 1){
      return false;
    } else if (id == 2){
      return true;
    } else if (id == 3){
      return true;
    } else if (id == 4){
      return false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ReservationDetailPageModel? reservationDetailPageModel = ref.watch(reservationDetailProvider(id));
    Logger().d("id값 잘 넘어왔나");
    Logger().d(id);
    //null 처리 : 상태값이 null일 경우, gif가 출력됨
    if(reservationDetailPageModel?.reservationDetail == null) {
      return Loading();
    }

    ReservationDetail reservationDetail = reservationDetailPageModel!.reservationDetail!;
    Logger().d("여기여기여기 =======", reservationDetail);

    String _setServiceIconName(category) {
      if(category == '가사도우미') {
        return 'cleaning_assistant_icon.png';
      }
      if(category == '이사청소') {
        return 'moving_cleaning_icon.PNG';
      }
      if(category == '사무실청소') {
        return 'office_cleaning_icon.png';
      }
      return 'air_conditioner_cleaning_icon.png';
    };
    
    

    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '', moveRoute: (){
        Navigator.pushNamedAndRemoveUntil(context, Move.ReservationListPage, (route) => false);
      },),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Image.asset('${Define.icons + _setServiceIconName(reservationDetail.firstCategory)}'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(reservationDetail.firstCategory, style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 8,),
                              TextLabel(text: setStatusName(reservationDetailPageModel!.reservationDetail!.status), is_active: setIsActive(reservationDetailPageModel!.reservationDetail!.status)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('서비스 일정'),
                        textBody6(reservationDetail.reservationDate),
                        textBody6(reservationDetail.option + "(" + reservationDetail.reservationTime + ")"),

                        SizedBox(height: 15.0,),

                        Text('내 주소'),
                        textBody6(reservationDetail.address),
                        textBody6(reservationDetail.addressDetail),

                        SizedBox(height: 15.0,),

                        Text('반려동물'),
                        textBody6(reservationDetail.pet ? '있음' : '없음'),
                      ],
                    ),
                  ),
                ),

                // TODO 완료 또는 취소된 내역이면 아래 (일정 변경하기 ~ 결제수단) 없애기
                if(reservationDetail.status == 2)
                  CustomDividerThin(),
                if(reservationDetail.status == 2)
                  ImageAndTextAndButton(title: '일정 변경하기', icon_name: 'cross_arrow.PNG', acting: (){
                  ref.read(reservationChangeProvider.notifier).setReservationId(reservationDetailPageModel!.reservationDetail!.reservationId);
                  ref.read(reservationChangeProvider.notifier).setCleaningDate(
                    reservationDetail.firstCategory,
                    reservationDetail.reservationDate,
                    reservationDetail.option,
                    reservationDetail.reservationTime,
                    reservationDetail.pet,
                    1,1
                   );
                  Navigator.pushNamed(context, Move.ReservationChangePage);
                },),
                if(reservationDetail.status == 2)
                  CustomDividerThin(),
                if(reservationDetail.status == 2)
                ImageAndTextAndButton(title: '일정 취소하기', icon_name: 'clear_icon.PNG', acting: (){
                  ref.read(reservationCancelProvider.notifier).setReservationId(reservationDetailPageModel!.reservationDetail!.reservationId);
                  ref.read(reservationCancelProvider.notifier).setCleaningDate(
                      reservationDetail.firstCategory,
                      reservationDetail.reservationDate,
                      reservationDetail.option,
                      reservationDetail.reservationTime,
                      reservationDetail.pet,
                      1,1
                  );
                  Navigator.pushNamed(context, Move.ReservationCancelPage);
                },),

                CustomDivider(),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text('부가정보 입력')
                  ),
                ),

                ImageAndTextAndButtonWithLabel(title: '출입방법', icon_name: 'home_icon.PNG',
                    button_text: reservationDetail.enter == "" || reservationDetail.enter == null ? "없음" : reservationDetail.enter,
                  isActive: reservationDetail.status == 2 ? true : false,
                  acting: () {
                    if(reservationDetail.status == 3 || reservationDetail.status == 4){
                      return;
                    }
                      // Navigator.pushNamed(context, Move.EnterAccessMethodsAfterPage);a
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EnterAccessMethodsAfterPage(id)));
                  }
                ),

                CustomDividerThin(),

                ImageAndTextAndButtonWithLabel(title: '기타 요청사항', icon_name: 'message_icon.png',
                    button_text: reservationDetail.otherRequest == "" || reservationDetail.otherRequest == null ? "없음" : reservationDetail.otherRequest,
                    isActive: reservationDetail.status == 2 ? true : false,
                    acting: () {
                      if(reservationDetail.status == 3 || reservationDetail.status == 4){
                        return;
                      }
                      // Navigator.pushNamed(context, Move.EnterOtherRequestsAfterPage);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EnterOtherRequestsAfterPage(id)));
                    }
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
                              // TODO 완료 여부에 따라 텍스트 변경 필요
                              textBody6('결제 금액'),
                              textBody6(reservationDetail.getFormattedPrice()),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                        Text('결제는 서비스가 완료된 후 진행됩니다', style: TextStyle(fontSize: 13, color: disableColor),),
                      ],
                    ),
                  ),
                ),
                // CustomDividerThin(),
                // ImageAndTextAndButtonWithLabel(title: '결제수단', icon_name: 'card_icon.PNG',
                //   // button_text: '카카오페이', is_active: true,
                //   // TODO
                //   // acting: Navigator.pushNamed(context, )
                // ),
                CustomDivider(),

                IconWithText(icon_name: Icons.info_outline, title: '주의 사항', acting: () {
                  Navigator.pushNamed(context, Move.CautionPage);
                }),
                SizedBox(height: 10.0),
                IconWithText(icon_name: CupertinoIcons.question_circle, title: '예약 문의', acting: () {
                  Navigator.pushNamed(context, Move.CustomerPage);
                }),

                SizedBox(height: 70,),

              ],
            ),
          ),
          // TODO 서비스 완료 혹은 취소된 내용이면 '확인' 버튼 없애기
          // TODO 결제 해야하면 결제하기 버튼이 노출되도록 하기
          Positioned(bottom: 0,
              child: Container(
                  // TODO move to 예약 내역
                  child: ColorButtonFullWith(text: '확인', action: (){
                    Navigator.pushNamed(context, Move.ReservationListPage);
                  })
              )
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/_core/constants/style.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/icon_text_button.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/reservation_success.dart';
import 'package:toyproject/ui/widget/blue_small_text_button.dart';
import 'package:toyproject/ui/widget/button/color_button.dart';
import 'package:toyproject/ui/widget/button/color_button_full_width.dart';
import 'package:toyproject/ui/widget/custom_modal/information_modal.dart';
import 'package:toyproject/ui/widget/divider/custom_divider.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/divider/custom_divider_thin.dart';
import 'package:toyproject/ui/widget/exclamationmark_title.dart';

class ReservationResultPage extends ConsumerWidget {
  const ReservationResultPage({super.key});

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
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
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
                      child: Text('부가정보 입력')
                  ),
                ),
                IconAndTextAndButton(title: '출입방법', icon_name: 'home_icon.PNG',
                  acting: () { Navigator.pushNamed(context, Move.EnterAccessMethodsPage); }
                ),

                CustomDividerThin(),

                IconAndTextAndButton(title: '기타 요청사항', icon_name: 'message_icon.png',
                    acting: () { Navigator.pushNamed(context, Move.EnterOtherRequestsPage); }
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
                        textBody6('2022년 4월 9일(토)'),
                        textBody6('2시간(오후 2시~오후 4시)'),

                        SizedBox(height: 15.0,),

                        Text('내 주소'),
                        textBody6('서울 성북구 보문로'),
                        textBody6('170 서울성북경찰서'),

                        SizedBox(height: 15.0,),

                        Text('반려동물'),
                        textBody6('있음'),
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
                              textBody6('결제 예정 금액'),
                              textBody6('61,400원'),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                        Text('결제는 서비스가 완료된 후 진행됩니다', style: TextStyle(fontSize: 13, color: disableColor),),
                      ],
                    ),
                  ),
                ),
                CustomDividerThin(),
                IconAndTextAndButton(title: '결제수단', icon_name: 'card_icon.PNG', button_text: 'KB국민카드', is_active: true,
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

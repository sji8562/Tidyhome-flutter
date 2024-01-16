import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/_core/utils/validator_util.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_result_page/result_page_view_model.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/color_button_full_width.dart';
import 'package:toyproject/ui/widget/button/soft_color_red_button.dart';
import 'package:toyproject/ui/widget/text_form_field/common_text_form_field.dart';

class EnterOtherRequestsPage extends ConsumerWidget {

  final _formKey = GlobalKey<FormState>();
  TextEditingController carefulETC = TextEditingController();
  TextEditingController requestETC = TextEditingController();

  EnterOtherRequestsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ResultPageModel? resultPageModel = ref.watch(resultPageProvider);
    carefulETC.text = resultPageModel!.carefulETC;
    requestETC.text = resultPageModel!.requestETC;
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '기타 요청사항'),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0,),
                  Text('특히 신경쓸 곳'),
                  SizedBox(height: 5.0,),

                  TextField(
                    controller: carefulETC,
                    maxLines: null, // 다중 행으로 설정하려면 null 또는 원하는 줄 수를 지정
                    maxLength: 150,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      hintText: '예) 화장실과 주방청소 신경 써주세요.',
                      hintStyle: TextStyle(color: disableColor, fontSize: 12.0),
                      // hintTextDirection: ,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: disableColor), // 상하좌우 회색 경계선
                        borderRadius: BorderRadius.all(Radius.circular(5.0)), // Optional: 모서리 둥글게 만들기
                      ),
                    ),
                    // onChanged: (text) {
                    //   // 텍스트가 변경될 때 실행되는 콜백 함수
                    //   print('Typed text: $text');
                    // },
                  ),

                  SizedBox(height: 20.0,),

                  Text('기타 요청사항'),
                  SizedBox(height: 5.0,),
                  TextField(
                    controller: requestETC,
                    maxLines: null, // 다중 행으로 설정하려면 null 또는 원하는 줄 수를 지정
                    maxLength: 150,
                    decoration: InputDecoration(
                      hintText: '예) 빨래는 돌리지 않아도 됩니다.',
                      hintStyle: TextStyle(color: disableColor, fontSize: 12.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: disableColor), // 상하좌우 회색 경계선
                        borderRadius: BorderRadius.all(Radius.circular(5.0)), // Optional: 모서리 둥글게 만들기
                      ),
                    ),
                    // onChanged: (text) {
                    //   // 텍스트가 변경될 때 실행되는 콜백 함수
                    //   print('Typed text: $text');
                    // },
                  ),

                  SizedBox(height: 20.0,),

                  // TODO 삭제하기 클릭 시 내용 clear
                  SoftColorRedButton(text: '삭제하기', funPageRoute: () {
                    ref.read(resultPageProvider.notifier).setRequestETC("", "");
                  }),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child:
              ColorButtonFullWith(text: '저장하기',
                  // TODO 출입 방법 저장
                  action: () {
                      ref.read(resultPageProvider.notifier).setRequestETC(carefulETC.text, requestETC.text);
                      Navigator.pushNamed(context, Move.ReservationResultPage);
                  })
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/_core/utils/validator_util.dart';
import 'package:toyproject/data/dto/request_dto/reservation/reservation_request.dart';
import 'package:toyproject/ui/pages/reservation_page/enter_access_methods_page/enter_access_methods_after_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_detail_page/reservation_detail_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_result_page/result_page.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_result_page/result_page_view_model.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/color_button_full_width.dart';
import 'package:toyproject/ui/widget/button/soft_color_red_button.dart';
import 'package:toyproject/ui/widget/loading.dart';
import 'package:toyproject/ui/widget/text_form_field/common_text_form_field.dart';

class EnterAccessMethodsAfterPage extends ConsumerWidget {
final id;

  final howToOpen = TextEditingController();
  final doorPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  EnterAccessMethodsAfterPage(this.id, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ReservationDetailPageModel? reservationDetailPageModel = ref.watch(reservationDetailProvider(id));
    if (reservationDetailPageModel?.reservationDetail == null){
      return Loading();
    }
    howToOpen.text = reservationDetailPageModel!.reservationDetail!.enter;
    doorPassword.text = reservationDetailPageModel!.reservationDetail!.enterPassword;
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '출입 방법', moveRoute: (){
        ref.read(reservationDetailProvider(id).notifier).fetchReservationDetail(id);
        Navigator.pop(context);
      }),
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.0,),
                    Text('공동 현관 출입방법'),

                    CommonTextFormField(
                        placeholderText: '예) 1234* 누르고 호출', funValidator: validateEnterMethod, controller: howToOpen,),

                    SizedBox(height: 20.0,),

                    Text('자택현관 비밀번호'),

                    CommonTextFormField(
                        placeholderText: '예) * 1234 #', funValidator: validateEnterMethod, controller: doorPassword,),
        
                    Image.asset('${Define.images}safety_info_image.png', width: double.infinity,),
        
                    // TODO 삭제하기 클릭 시 내용 clear
                    SoftColorRedButton(text: '삭제하기', funPageRoute: () {
                      ref.read(enterAccessMethodsProvider.notifier).deleteEnterAccessMethods(id);
                      howToOpen.text = "";
                      doorPassword.text = "";
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
                      // 유효성검사 통과 시
                      if(_formKey.currentState!.validate()){
                        EnterAccessUpdateDTO request = EnterAccessUpdateDTO(id, howToOpen.text, doorPassword.text);
                        ref.read(enterAccessMethodsProvider.notifier).updateEnterAccessMethods(request);
                      }
                    })
            )
          ],
        ),
      ),
    );
  }
}

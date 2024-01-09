import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/color.dart';

class InformationModal extends StatelessWidget {
  final String type;

  const InformationModal({super.key, required this.type});

  @override
  Widget build(BuildContext context) {

    String title = '';
    String content = '';

    if(type == 'house_keeping_fee_rule') {
      title = '취소/변경 수수료 규정';
      content = '''- 전날 18:00 이후 취소/변경 :
서비스 요금의 30%를 수수료로 부과
- 시작 1시간 전 이후 취소/변경 :
서비스 요금 전액을 수수료로 부과''';
    }

    return AlertDialog(
      backgroundColor: basicColorW,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1.0),
      ),
      title: Text(title,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            content,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 15.0),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // 모달 닫기
            },
            style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                primary: basicColorW,
                minimumSize: Size(double.infinity, 48.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.0))
            ),
            child: Text('확인'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/soft_color_button.dart';

class CalendarTestPage extends StatefulWidget {
  const CalendarTestPage({Key? key}) : super(key: key);

  @override
  _CalendarTestPageState createState() => _CalendarTestPageState();
}

class _CalendarTestPageState extends State<CalendarTestPage> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '일정 변경하기'),
      body: Stack(
        children: [
          SoftColorButton(
            text: '날짜 선택하기',
            funPageRoute: () async {

              await _showCalendarPicker(context);

            },
          ),
        ],
      ),
    );
  }

  Future<void> _showCalendarPicker(BuildContext context) async {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      shape: LinearBorder(),
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('날짜 선택하기', style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 20,),
              _buildCalendarPicker(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCalendarPicker() {
    return CalendarDatePicker(
      onDateChanged: (DateTime? date) {
        if (date != null) {
          setState(() {
            _selectedDate = date;
          });
          Navigator.pop(context); // 선택 후 바텀 시트 닫기
        }
      },
      initialDate: DateTime.now(),
      // firstDate: DateTime(2000),
      firstDate: DateTime.now(), // 오늘 날짜부터 선택 가능
      lastDate: DateTime(2101),
    );
  }
}

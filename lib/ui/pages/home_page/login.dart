import 'package:flutter/material.dart';

import '../../../data/store/PhoneAuthManager.dart';


class PhoneAuthPage extends StatefulWidget {
  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  PhoneAuthManager _phoneAuthManager = PhoneAuthManager();

  String _verificationId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('휴대폰 번호로 인증'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: '휴대폰 번호 입력',
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String phoneNumber = _phoneNumberController.text;
                _verificationId = await _phoneAuthManager.verifyPhoneNumber(phoneNumber);
              },
              child: Text('인증 코드 요청'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '인증 코드 입력',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String smsCode = _codeController.text;
                await _phoneAuthManager.signInWithPhoneNumber(_verificationId, smsCode);
              },
              child: Text('인증 확인'),
            ),
          ],
        ),
      ),
    );
  }
}

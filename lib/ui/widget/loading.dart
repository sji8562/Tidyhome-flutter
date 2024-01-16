import 'package:flutter/material.dart';

import '../../_core/constants/color.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: basicColorW,
      child: Center(
        child: Image.asset('assets/images/giphy.gif', fit: BoxFit.cover, width: 150, height: 150),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/style.dart';

class DrawerTextTabWithIcon extends StatelessWidget {
  final IconData icon_name;
  final String title;
  final acting;

  const DrawerTextTabWithIcon({super.key, required this.icon_name, required this.title, this.acting});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: InkWell(
        onTap: acting != null ? acting : () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon_name, size: 19),
            SizedBox(width: 16.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textBody5(title),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/Define.dart';

class IconAndTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  final moveRoute;

  const IconAndTitle({super.key, required this.icon, required this.title, this.moveRoute});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon
          ),
          SizedBox(width: 15.0,),
          InkWell(child: Text('${title}'), onTap: () {},) ],
      ),
    );
  }
}

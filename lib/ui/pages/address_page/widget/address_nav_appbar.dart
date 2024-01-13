import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/style.dart';

import '../../../../_core/constants/color.dart';

class AddressNavAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final onPressed;
  final List<Widget>? actions;
  const AddressNavAppbar({
    super.key,
    required this.text,
    this.onPressed,
    this.actions,
  });
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0.1,
      automaticallyImplyLeading: false,
      backgroundColor: basicColorW,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, size: 22, color: basicColorB5),
        onPressed: () {
          onPressed();
        },
      ),
      titleSpacing: 0,
      centerTitle: true,
      title: Container(
        width: 250,
        child: Center(
          child: Text(
            "${text}",
            style: titleStyle2(),
          ),
        ),
      ),
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.0);
}

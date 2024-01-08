import 'package:flutter/material.dart';

class TitleIconTab extends StatelessWidget {

  final String title;
  final moveRoute;

  const TitleIconTab({super.key, required this.title, this.moveRoute});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            children: [
              Text(title),
              InkWell(
                onTap: moveRoute,
                child: Icon(Icons.navigate_next))
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
          child: Divider(),
        ),
      ],
    );
  }
}

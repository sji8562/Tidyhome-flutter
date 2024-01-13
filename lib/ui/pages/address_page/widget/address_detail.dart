import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widget/check_box/check_box_item.dart';


class AddressDetail extends StatelessWidget {
  String? destination;
  String? destinationDetail;
  bool? isDefaultAddress;
  AddressDetail(
      {super.key,
      this.destination,
      this.destinationDetail,
      this.isDefaultAddress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CheckBoxItem(text: ""),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isDefaultAddress == true ?  ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("기본 배송지", style: TextStyle(fontSize: 12)),
                    ),
                    decoration: BoxDecoration(color: Colors.black12),
                  ),
                ) : SizedBox()
                 ,
                SizedBox(
                  height: 1,
                ),
                Text(
                  "${destination}",
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "${destinationDetail}",
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.pencil))
        ],
      ),
    );
  }
}

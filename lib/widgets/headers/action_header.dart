import 'package:flutter/material.dart';
import 'package:nieveapptest/shared/constants.dart';
import 'package:nieveapptest/shared/textstyle.dart';
import 'package:nieveapptest/widgets/image_contents/image_custom.dart';

class ActionHeader extends StatelessWidget {
  String title, desc;
  Function()? onBack;

  ActionHeader({
    required this.title,
    required this.desc,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: border
          )
        )
      ),
      padding: EdgeInsets.all(32),
      width: double.infinity,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              onBack != null ? onBack!() : Navigator.pop(context);
            },
            child: ImageCustom(
              height: 20,
              width: 20,
              image: AssetImage('assets/icons/ic-back.png'),
            ),
          ),
          SizedBox(width: 32,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: megaBlackSemibold,
              ),
              Text(
                desc,
                style: regularGrayLight,
              )
            ],
          )
        ],
      ),
    );
  }
}
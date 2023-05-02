import 'package:flutter/material.dart';
import 'package:nieveapptest/shared/constants.dart';
import 'package:nieveapptest/shared/textstyle.dart';

class StackHeader extends StatelessWidget {
  String title, desc;

  StackHeader({
    required this.title,
    required this.desc
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
      padding: EdgeInsets.symmetric(
        vertical: 32
      ),
      width: double.infinity,
      child: Column(
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
      ),
    );
  }
}
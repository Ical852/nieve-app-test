import 'package:flutter/material.dart';
import 'package:nieveapptest/shared/constants.dart';
import 'package:nieveapptest/shared/textstyle.dart';

class MainButtonCustom extends StatelessWidget {
  Function() onPressed;
  String title;
  String? type;
  bool disabled;
  Widget? leftContent;

  MainButtonCustom({
    required this.onPressed,
    required this.title,
    this.type,
    this.disabled = false,
    this.leftContent
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? 0.3 : 1,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: type == 'secondary' ? [blueGrey1, blueGrey1] : [blue2, blue1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
          borderRadius: BorderRadius.circular(8)
        ),
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent.withOpacity(0.1),
          ),
          onPressed: disabled ? (){} : onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leftContent ?? SizedBox(),
              leftContent != null ? SizedBox(width: 10,) : SizedBox(),
              Text(
                title,
                style: type == 'secondary' ? mediumBlackSemibold : mediumWhiteSemibold
              ),
            ],
          ),
        ),
      ),
    );
  }
}
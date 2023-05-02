import 'package:flutter/material.dart';
import 'package:nieveapptest/shared/constants.dart';
import 'package:nieveapptest/shared/textstyle.dart';
import 'package:nieveapptest/widgets/image_contents/image_custom.dart';

class SettingsItem extends StatelessWidget {
  String icon, title, desc;
  Function() onPressed;

  SettingsItem({
    required this.icon,
    required this.title,
    required this.desc,
    required this.onPressed
  });

  String generateIcon() {
    if (icon == 'pencil') {
      return 'assets/icons/ic-pencil.png';
    } else {
      return 'assets/icons/ic-pencil.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16
        ),
        height: 76,
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: black1.withOpacity(0.2),
              blurRadius: 2,
              offset: Offset(0, 2)
            ),
          ],
          borderRadius: BorderRadius.circular(14)
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52  ,
              decoration: BoxDecoration(
                color: grey2,
                borderRadius: BorderRadius.circular(14)
              ),
              child: ImageCustom(
                height: 20,
                width: 20,
                margin: EdgeInsets.all(16),
                image: AssetImage(generateIcon()),
              ),
              margin: EdgeInsets.only(right: 16),
            ),
    
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: regularBlackSemibold,
                  ),
                  Text(
                    desc,
                    style: smallGrayRegular,
                  )
                ],
              ),
            ),
    
            ImageCustom(
              width: 26,
              height: 26,
              image: AssetImage("assets/icons/ic-right.png"),
            )
          ],
        ),
      ),
    );
  }
}
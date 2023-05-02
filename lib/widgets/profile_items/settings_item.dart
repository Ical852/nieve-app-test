import 'package:flutter/material.dart';
import 'package:nieveapptest/shared/constants.dart';

class SettingsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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

        ],
      ),
    );
  }
}
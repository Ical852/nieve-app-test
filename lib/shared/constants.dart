import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle poppinsText = GoogleFonts.poppins();

double safeAreaPadding(context) {
  return MediaQuery.of(context).padding.top;
}

double bottomSafeAreaPadding(context) {
  return MediaQuery.of(context).padding.bottom;
}

Color black1 = Color(0xff151D1F);
Color white = Color(0xffffffff);
Color grey1 = Color(0xff96A3A9);
Color grey2 = Color(0xffF8FBFC);
Color border = Color(0xffEEEEEE);
Color blue1 = Color(0xff5FCAF8);
Color blue2 = Color(0xff5FC9F9);
Color blue3 = Color(0xffD7E7EC);
Color red1 = Color(0xffF85F5F);
Color blueGrey1 = Color(0xffD5E4E9);
Color green1 = Color(0xff61B176);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight blackBold = FontWeight.w900;

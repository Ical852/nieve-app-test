import 'package:flutter/material.dart';
import 'package:nieveapptest/shared/constants.dart';
import 'package:nieveapptest/shared/textstyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> prefs() async {
  return await SharedPreferences.getInstance();
}

void setStringPref(key, value) async {
  var pref = await prefs();
  pref.setString(key, value);
}

Future<Object?> getStringPref(key, value) async {
  var pref = await prefs();
  return pref.get(key).toString();
}

void removeStringPref(key) async {
  var pref = await prefs();
  pref.remove(key);
}

void clearStringPref() async {
  var pref = await prefs();
  pref.clear();
}

Color getColorType(type) {
  if (type == 'danger') {
    return red1;
  } else if (type == 'info') {
    return blue1;
  } else {
    return green1;
  }
}

void showGLobalAlert(type, text, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: 2),
    content: Text(
      text,
      style: regularWhiteSemibold.copyWith(
        fontWeight: bold
      ),
      textAlign: TextAlign.center,
    ),
    backgroundColor: getColorType(type),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(8)
      )
    ),
  ));
}
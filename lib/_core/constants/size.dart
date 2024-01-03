import 'package:flutter/material.dart';

const double gap_xs = 5.0;
const double gap_s = 6.0;
const double gap_m = 10.0;
const double gap_l = 20.0;
const double gap_xl = 40.0;
const double gap_xxl = 100.0;

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getDrawerWidth(BuildContext context) {
  return getScreenWidth(context) * 0.6;
}
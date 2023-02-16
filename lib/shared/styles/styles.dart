import 'package:flutter/material.dart';

abstract class AppTextStyles{
  /// - weight: w200
  /// - family: cairo
  static const TextStyle boldtitles =  TextStyle(fontWeight: FontWeight.bold,fontSize: 20);

  /// - weight: w300
  /// - family: cairo
  static const TextStyle w300 =  TextStyle(fontWeight: FontWeight.w300, fontSize: 30);

  /// - weight: w400
  /// - family: cairo
  static const TextStyle w400 =  TextStyle(fontWeight: FontWeight.w400);

  /// - weight: w500
  /// - family: cairo
  static const TextStyle smTitles =  TextStyle(fontWeight: FontWeight.w500,fontSize: 15);

  /// - weight: w600
  /// - family: cairo
  static const TextStyle w600 =  TextStyle(fontWeight: FontWeight.w600);

  /// - weight: w700
  /// - family: cairo
  static const TextStyle lrTitles =  TextStyle(fontWeight: FontWeight.w500,fontSize: 30);

  /// - weight: w800
  /// - family: cairo
  static const TextStyle w800 =  TextStyle(fontWeight: FontWeight.w800);

  /// - weight: w900
  /// - family: cairo
  static const TextStyle w900 =  TextStyle(fontWeight: FontWeight.w900);


}
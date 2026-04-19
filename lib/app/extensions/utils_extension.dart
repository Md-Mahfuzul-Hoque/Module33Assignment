import 'package:flutter/material.dart';

extension UtilsExtension on BuildContext {

  TextTheme get textTheme => Theme.of(this).textTheme;

  Size get screenSize => MediaQuery.of(this).size;

}
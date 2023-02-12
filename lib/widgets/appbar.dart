import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

NewGradientAppBar myAppBar(String text, bool? centerTitle, List<Color> list) {
  return NewGradientAppBar(
    title: Text(text),
    centerTitle: centerTitle ?? true,
    gradient: LinearGradient(colors: list),
  );
}

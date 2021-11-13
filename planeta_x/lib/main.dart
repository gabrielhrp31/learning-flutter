import 'package:flutter/material.dart';
import 'package:planeta_x/theme/custom_theme.dart';
import 'package:planeta_x/views/home.dart';

void main() {
  runApp(MaterialApp(
    title: 'Planeta X',
    theme:CustomTheme.lightTheme,
    home: const Home(),
  ));
}
import 'package:flutter/material.dart';
import 'package:imc/theme/custom_theme.dart';
import 'package:imc/views/imc_view.dart';

void main() {
  runApp(
      MaterialApp(
        title:"IMC",
        theme: CustomTheme.lightTheme,
        home: const ImcView()
    )
  );
}
import 'package:cadastrat_usuarios/theme/custom_theme.dart';
import 'package:cadastrat_usuarios/ui/cadastro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        title:"Home",
        theme:CustomTheme.lightTheme,
        home: Cadastro()
    )
  );
}
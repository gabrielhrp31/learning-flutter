import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Input extends StatelessWidget {
  final String name;
  final String labelText;
  final String hintText;
  final String initialValue;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final bool obscureText;

  Input(this.name,
      {this.keyboardType=TextInputType.text,this.validator=null,this.initialValue = '',this.labelText = '', this.obscureText = false, this.hintText = ''});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      initialValue: initialValue,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator:  validator,
      style: Theme.of(context).inputDecorationTheme.labelStyle,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:Theme.of(context).inputDecorationTheme.hintStyle ,
        labelStyle:Theme.of(context).inputDecorationTheme.labelStyle ,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        focusedBorder:Theme.of(context).inputDecorationTheme.focusedBorder ,
        labelText: labelText,
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  final String text;
  final Function() _onPressed;

  Button(this.text,this._onPressed);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed:_onPressed,
            child: Text(
                text,
                style: Theme.of(context).textTheme.button),
          ),
        ),
      )
    );
  }
}

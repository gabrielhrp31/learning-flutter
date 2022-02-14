import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color textColor;
  final Function onPressed;

  const IconTextButton({Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
    required this.iconColor,
    this.textColor = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: ()=>onPressed(),
        child:Row(
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            Text(
                text,
              style: TextStyle(
                color: textColor
              ),
            )
          ],
        ) ,
      );
  }
}

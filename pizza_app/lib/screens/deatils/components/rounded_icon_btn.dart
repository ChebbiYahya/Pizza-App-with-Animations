import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';

class RoundIconBtn extends StatelessWidget {
  const RoundIconBtn({
    super.key,
    required this.icondata,
    this.color = primaryColor,
    required this.press,
  });
  final IconData icondata;
  final Color color;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: press,
      padding: EdgeInsets.zero,
      shape: const CircleBorder(),
      elevation: 0,
      color: Colors.white,
      height: 36,
      minWidth: 36,
      child: Icon(
        icondata,
        color: color,
      ),
    );
  }
}

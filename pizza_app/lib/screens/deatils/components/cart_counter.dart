import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/screens/deatils/components/rounded_icon_btn.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF6F6F6),
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Row(
        children: [
          RoundIconBtn(
            icondata: Icons.remove,
            color: Colors.black38,
            press: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding / 4),
            child: Text(
              "1",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          RoundIconBtn(
            icondata: Icons.add,
            press: () {},
          )
        ],
      ),
    );
  }
}

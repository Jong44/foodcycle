import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final border;
  final icon;
  final press;
  const CircleIconButton(
      {super.key, this.border, this.icon, required this.press});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 40,
        decoration: BoxDecoration(shape: BoxShape.circle, border: border),
        child: icon,
      ),
    );
  }
}

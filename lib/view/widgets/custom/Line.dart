import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  final width;
  const Line({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 2,
      decoration: BoxDecoration(color: Color(0xffF2F2F2)),
    );
  }
}

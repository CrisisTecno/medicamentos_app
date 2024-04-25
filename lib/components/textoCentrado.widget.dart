import 'package:flutter/material.dart';
import 'package:medinas_app/public/theme/colors.dart';

class TextoCentrado extends StatelessWidget {
  final String texto;
  final double tap;
  final double h;
  final double w;
  final Color color;
  const TextoCentrado({
    super.key,
    required this.texto,
    required this.tap,
    required this.h,
    required this.w,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: h,
      width: w,
      margin: EdgeInsets.only(top: tap),
      child: Row(
        children: [
          Spacer(),
          Text(
            texto,
            style: TextStyle(color: primary.withOpacity(0.7), fontSize: 15),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final Color color1;
  final Color color2;
  final Color textcolor;
  final String texto;
  final double tapArriba;
  final VoidCallback onTap;
  const CustomButtom({
    super.key,
    required this.color1,
    required this.color2,
    required this.texto,
    required this.onTap,
    required this.textcolor,
    required this.tapArriba,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: color1.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color2.withOpacity(0.7))),
        margin: EdgeInsets.only(right: 40, left: 40, top: tapArriba),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            texto,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w100, color: textcolor),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medinas_app/utils/sizer.dart';

class InputTextPublish extends StatelessWidget {
  final String label;
  final Icon? icon;
  final Color borderColor;
  final Color borderFocusedColor;
  const InputTextPublish(
      {super.key,
      required this.label,
      this.icon,
      required this.borderColor,
      required this.borderFocusedColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.black,
        fontSize: 15.h,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        hintText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(width: 1, color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(width: 2, color: borderFocusedColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
        suffixIcon: icon != null
            ? Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: icon,
              )
            : null,
      ),
    );
  }
}

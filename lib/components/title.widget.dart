import 'package:flutter/material.dart';
import 'package:medinas_app/public/theme/colors.dart';

class TitleApp extends StatelessWidget {
  const TitleApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Text(
          'Medicinas',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontSize: 35,
              fontWeight: FontWeight.w100),
        ),
        Text(
          'app',
          style: TextStyle(
              color: primary.withOpacity(0.7),
              fontSize: 35,
              fontWeight: FontWeight.bold),
        ),
        Spacer(),
      ],
    );
  }
}

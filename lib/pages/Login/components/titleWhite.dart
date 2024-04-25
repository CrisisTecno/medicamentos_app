import 'package:flutter/material.dart';
import 'package:medinas_app/components/title.widget.dart';

class TitleWhite extends StatelessWidget {
  const TitleWhite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 90, right: 90),
      padding: EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: TitleApp(),
    );
  }
}

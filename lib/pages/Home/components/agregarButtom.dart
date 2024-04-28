import 'package:flutter/material.dart';
import 'package:medinas_app/public/theme/colors.dart';
import 'package:medinas_app/routes/routing.dart';

class AgregarProducto extends StatelessWidget {
  const AgregarProducto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RouteManager.addProductScreen);
      },
      child: Container(
        decoration: BoxDecoration(
          color: secondary.withOpacity(0.6),
          borderRadius: BorderRadius.circular(55),
        ),
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(15),
        child: Text(
          'Agregar un producto',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: primary),
        ),
      ),
    );
  }
}

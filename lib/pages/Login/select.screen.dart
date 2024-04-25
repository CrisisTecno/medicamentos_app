import 'package:flutter/material.dart';
import 'package:medinas_app/components/custom.buttom.dart';
import 'package:medinas_app/components/title.widget.dart';
import 'package:medinas_app/public/theme/colors.dart';
import 'package:medinas_app/routes/routing.dart';

import '../../components/textoCentrado.widget.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Center(
            heightFactor: 1,
            child: Image.asset('lib/public/assets/icons/logo2.png')),
        TitleApp(),
        CustomButtom(
          color1: primary,
          color2: primary,
          textcolor: Colors.white,
          texto: 'Iniciar Sesion',
          onTap: () {
            Navigator.of(context).pushNamed(RouteManager.homeScreen);
          },
          tapArriba: 45,
        ),
        CustomButtom(
          color1: Colors.white,
          color2: primary,
          textcolor: primary,
          texto: 'Crear Cuenta',
          onTap: () {
            Navigator.of(context).pushNamed(RouteManager.createScreen);
          },
          tapArriba: 15,
        ),
        TextoCentrado(
          color: Colors.white,
          h: double.infinity,
          w: double.infinity,
          texto: 'Continuar como Invitado',
          tap: 40,
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }
}

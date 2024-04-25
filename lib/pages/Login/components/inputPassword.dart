import 'package:flutter/material.dart';
import 'package:medinas_app/controller/loginProvider.dart';
import 'package:provider/provider.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  @override
  void initState() {
    super.initState();
    widget._passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget._passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 40,
        left: 40,
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: widget._passwordController,
        style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'por favor ingresa tu usuario';
          }
          if (value?.length != null && value!.length > 3) {
            return 'Debe tener un minimo de caracteres';
          }
          return null;
        },
        onChanged: (value) {
          final userProvider =
              Provider.of<loginProvider>(context, listen: false);
          userProvider.setPUser(value);
          print(widget._passwordController.text);
        },
        decoration: InputDecoration(
          labelText: 'Contraseña',
          labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          border: InputBorder.none,

          // hintText: 'Ingresa tu usuario',
          // fillColor: Colors.white,
          // focusColor: Colors.white,
          // iconColor: Colors.white,
          // hoverColor: Colors.white,
          // suffixIcon: _passwordController.text.isEmpty
          //     ? IconButton(
          //         onPressed: () => _passwordController.clear(),
          //         icon: Icon(Icons.clear))
          //     : null,
        ),
      ),
    );
  }
}

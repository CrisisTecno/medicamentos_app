import 'package:flutter/material.dart';
import 'package:medinas_app/controller/loginProvider.dart';
import 'package:provider/provider.dart';

class InputEmail extends StatefulWidget {
  const InputEmail({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  State<InputEmail> createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  @override
  void initState() {
    super.initState();
    widget._emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget._emailController.dispose();

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
        controller: widget._emailController,
        style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),
        onChanged: (value) {
          final userProvider =
              Provider.of<loginProvider>(context, listen: false);
          userProvider.setUserName(value);
          print(widget._emailController.text);
        },
        decoration: InputDecoration(
          labelText: 'Usuario',

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

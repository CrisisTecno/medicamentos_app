import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medinas_app/components/custom.buttom.dart';
import 'package:medinas_app/controller/loginProvider.dart';
import 'package:medinas_app/controller/userProvider.dart';
import 'package:medinas_app/pages/Login/components/inputEmail.dart';
import 'package:medinas_app/pages/Login/components/inputPassword.dart';
import 'package:medinas_app/pages/Login/components/titleWhite.dart';
import 'package:medinas_app/public/theme/colors.dart';
import 'package:medinas_app/routes/routing.dart';
import 'package:medinas_app/utils/tuplas.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = '';
  bool _isLoading = false;

  Future<void> _signIn() async {
    setState(() {
      _errorMessage = '';
      _isLoading = true;
    });

    try {
      final userProvider = Provider.of<loginProvider>(context, listen: false);
      // String userEmail = userProvider.user + '';
      // String puser = userProvider.puser + '';
      String userEmail = 'tecn0crisis0@gmail.com';
      String puser = 'SCristhian69*';
      if (userEmail.isEmpty && puser.isEmpty) {
        setState(() {
          _errorMessage = 'Debes Ingresar las Credenciales';
        });
        return;
      }

      print("aca");
      print(userProvider.puser);
      print(userProvider.user);

      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmail,
        password: puser,
      );

      print('Usuario inició sesión: ${userCredential.user}');
      try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('User')
            .where('email', isEqualTo: userEmail.trim())
            .get();
        if (querySnapshot.docs.isNotEmpty) {
          print("el usuario existe");
          print(querySnapshot.docs.first);
          final userProvider =
              Provider.of<UserProvider>(context, listen: false);
          await userProvider.fetchAndSetUser(userEmail);
        } else {
          setState(() {
            _errorMessage = 'El usuario NO Existe';
          });
          print("el usuario no existe");
        }
        Navigator.of(context).pushNamed(RouteManager.homeScreen);
      } catch (e) {
        print(e);
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      setState(() {
        _errorMessage =
            loginMessages[e.code] ?? 'Ocurrió un error desconocido.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _userController.addListener(() {
      setState(() {});
    });
    _passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: Stack(
        children: [
          Column(
            children: [
              Spacer(),
              Center(
                  heightFactor: 1,
                  child: Image.asset('lib/public/assets/icons/loginImage.jpg')),
              TitleWhite(),
              SizedBox(
                height: 15,
              ),
              InputEmail(emailController: _userController),
              SizedBox(
                height: 15,
              ),
              InputPassword(passwordController: _passwordController),
              _errorMessage.isEmpty
                  ? SizedBox(
                      height: 15,
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          _errorMessage,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.red.withOpacity(1)),
                        ),
                      ],
                    ),
              CustomButtom(
                color1: Colors.white,
                color2: secondary,
                textcolor: primary,
                texto: 'Iniciar Sesion',
                onTap: _signIn,
                tapArriba: 15,
              ),
              Spacer(),
            ],
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(
                  color: primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

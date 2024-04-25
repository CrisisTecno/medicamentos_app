import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medinas_app/controller/appProvider.dart';
import 'package:medinas_app/controller/userProvider.dart';
import 'package:medinas_app/pages/Login/select.screen.dart';
import 'package:medinas_app/routes/routing.dart';
import 'package:provider/provider.dart';

import '../Home/home.screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = true;

  Future<void> _fetchUserData() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    await userProvider.fetchAndSetUser('tecn0crisis0@gmail.com');
  }

  Future<void> fetchUtils() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Utils').get();
      print(querySnapshot);
      final appProvider = Provider.of<AppProvider>(context, listen: false);
      if (querySnapshot.docs.isNotEmpty) {
        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
          print("por aca");
          final data = doc.data() as Map<String, dynamic>;

          appProvider.setCategoria(data["numCategorias"]);
        }
      }
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 0), () {
      // Navigator.of(context).pushReplacement(
      //  RouteManager.selectScreen
      // );
      fetchUtils();
      _fetchUserData();
      Navigator.of(context).pushNamed(RouteManager.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeIn(
            delay: const Duration(milliseconds: 200),
            animate: animate,
            child: Image.asset(
                'lib/public/assets/icons/logo.png')), // Muestra tu logo
      ),
    );
  }
}

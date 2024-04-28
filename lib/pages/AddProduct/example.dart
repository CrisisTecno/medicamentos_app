import 'package:flutter/material.dart';
import 'package:medinas_app/components/custom.buttom.dart';
import 'package:medinas_app/pages/AddProduct/components/input.dart';
import 'package:medinas_app/public/theme/colors.dart';
import 'package:medinas_app/utils/sizer.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: CustomButtom(
          color1: primary,
          color2: secondary,
          onTap: () {},
          tapArriba: 15,
          textcolor: Colors.white,
          texto: 'Agregar Producto',
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Row(
                  children: [
                    Container(
                      width: 140.h,
                      height: 140.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    SizedBox(width: 20.h),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Medicamento',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.h)),
                              Spacer(),
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          InputTextPublish(
                              label: 'Nombre del Medicamente',
                              borderColor: Colors.black.withOpacity(0.2),
                              borderFocusedColor: primary),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Descripción',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.h,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    InputTextPublish(
                        label: '¿Qué se abordará en la reunión?',
                        borderColor: Colors.black.withOpacity(0.2),
                        borderFocusedColor: primary),
                    SizedBox(height: 16.h),
                    SizedBox(height: 16.h),
                    InputTextPublish(
                        label: 'https://meet.google.com/cvq-qrri-rus',
                        borderColor: Colors.black.withOpacity(0.2),
                        borderFocusedColor: primary),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

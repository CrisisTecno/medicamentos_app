import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medinas_app/components/custom.buttom.dart';
import 'package:medinas_app/components/title.widget.dart';
import 'package:medinas_app/controller/appProvider.dart';
import 'package:medinas_app/pages/AddProduct/components/input.dart';
import 'package:medinas_app/pages/Login/components/titleWhite.dart';
import 'package:medinas_app/public/theme/colors.dart';
import 'package:medinas_app/utils/sizer.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  String dropdownValue = 'Público';
  String onlineStatus = 'Online';
  int? _selectedNumber;
  List<int> _numbers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetch();
  }

  Future<void> _fetch() async {
    try {
      final appProvider = Provider.of<AppProvider>(context, listen: true);
      final List<int> numbers =
          List<int>.generate(appProvider.categorias, (int index) => index);
      setState(() {
        _numbers = numbers;
      });
    } catch (e) {
      print('algo salio mal:$e');
    }
  }

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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              TitleApp(),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Row(
                  children: [
                    Stack(children: [
                      Container(
                        width: 140.h,
                        height: 140.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Positioned(
                        top: -8,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(top: 16.0),
                            child: CircleAvatar(
                              radius:
                                  20.0, // Ajusta el valor si necesitas un tamaño específico
                              backgroundColor: Colors.white,
                              child: SvgPicture.asset(
                                'lib/public/assets/icons_svg/camara.svg',
                                height: 20.0,
                                width: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(width: 20.h),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Spacer(),
                              TitleAux(
                                title: 'Medicamento:',
                              ),
                              Spacer(),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          InputTextPublish(
                              label: 'Nombre del Medicamento',
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
                    TitleAux(title: 'Descripcion'),
                    SizedBox(height: 5.h),
                    InputTextPublish(
                        label: 'Este Medicamento......',
                        borderColor: Colors.black.withOpacity(0.2),
                        borderFocusedColor: primary),
                    SizedBox(height: 10.h),
                    TitleAux(title: 'Indicaciones'),
                    SizedBox(height: 5.h),
                    InputTextPublish(
                        label: 'Usar este medicamento con......',
                        borderColor: Colors.black.withOpacity(0.2),
                        borderFocusedColor: primary),
                    SizedBox(height: 10.h),
                    TitleAux(title: 'Cantidad Actual'),
                    SizedBox(height: 5.h),
                    InputTextPublish(
                        label: '15',
                        borderColor: Colors.black.withOpacity(0.2),
                        borderFocusedColor: primary),
                    SizedBox(height: 10.h),
                    TitleAux(title: 'Precio'),
                    SizedBox(height: 5.h),
                    InputTextPublish(
                        label: '18.15 Bs',
                        borderColor: Colors.black.withOpacity(0.2),
                        borderFocusedColor: primary),
                    SizedBox(height: 10.h),
                    TitleAux(title: 'Pertenece a la vitrina:'),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.h, vertical: 5.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.h),
                              border: Border.all(
                                color: Colors.black.withOpacity(0.2),
                                width: 1,
                              )),
                          child: DropdownButton<int>(
                            value: _selectedNumber,
                            hint: Text('Elige una Vitrina'),
                            items: _numbers.map((int value) {
                              return DropdownMenuItem<int>(
                                value: value + 1,
                                child: Text((value + 1).toString()),
                              );
                            }).toList(),
                            onChanged: (int? newValue) {
                              setState(() {
                                _selectedNumber = newValue;
                                print(_selectedNumber);
                              });
                            },
                            focusColor: null,
                            focusNode: null,
                            alignment: Alignment.center,
                            underline: Container(),
                            style: TextStyle(fontSize: 15.h),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
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

class TitleAux extends StatelessWidget {
  final String title;
  const TitleAux({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.h,
        color: Colors.black,
      ),
    );
  }
}

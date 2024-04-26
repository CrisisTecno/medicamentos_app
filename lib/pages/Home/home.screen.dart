import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medinas_app/components/textoCentrado.widget.dart';
import 'package:medinas_app/components/title.widget.dart';
import 'package:medinas_app/controller/appProvider.dart';
import 'package:medinas_app/controller/userProvider.dart';
import 'package:medinas_app/models/medicament.model.dart';
import 'package:medinas_app/pages/Home/components/agregarButtom.dart';
import 'package:medinas_app/pages/Login/components/titleWhite.dart';
import 'package:medinas_app/public/theme/colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  List<Medicamento> _data = [];
  List<List<Medicamento>> datax = [];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final appProvider = Provider.of<AppProvider>(context, listen: true);

      List<List<Medicamento>> datax2 =
          List.generate(appProvider.categorias, (_) => []);

      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Medicamento').get();

      List<Medicamento> combinedData = [];
      if (querySnapshot.docs.isNotEmpty) {
        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
          Medicamento medicament = Medicamento.fromDocument(doc);

          // Map<String, dynamic> medicament = doc.data() as Map<String, dynamic>;
          combinedData.add(medicament);

          int categoriaIndex = medicament.categoria - 1;
          if (categoriaIndex >= 0 && categoriaIndex < appProvider.categorias) {
            datax2[categoriaIndex].add(medicament);
          }
        }
      }
      setState(() {
        if (mounted) {
          _data = combinedData;
          datax = datax2;
        }
      });
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    print(user);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                TitleWhite(),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  height: 800,
                  child: _isLoading
                      ? Center()
                      : ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            var vidrinaData = datax[index];

                            print("por aca aca wee");
                            print(index);
                            print(datax);
                            return Vitrina(
                              i: index,
                              data: datax[index],
                              isLoading: _isLoading,
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: datax.length,
                        ),
                ),
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
        floatingActionButton:
            user != null && user.rol == 'ADMIN' ? AgregarProducto() : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class Vitrina extends StatelessWidget {
  const Vitrina({
    super.key,
    required bool isLoading,
    required int i,
    required List<Medicamento> data,
  })  : _isLoading = isLoading,
        _data = data,
        _i = i;

  final bool _isLoading;
  final List<Medicamento> _data;
  final int _i;

  @override
  Widget build(BuildContext context) {
    final numVitrina = 'Vitrina #' + _i.toString();
    return Column(
      children: [
        TextoCentrado(
          color: Colors.white,
          h: 30,
          w: 500,
          tap: 5,
          texto: numVitrina,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 500,
          height: 175,
          child: _isLoading && _data.isEmpty
              ? Center()
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    var medicamentData = _data[index];
                    String precioConvertido = medicamentData.precio.toString();
                    String cantidadConvertido =
                        medicamentData.cantidad.toString();
                    return CardMedicamento(
                      nombre: medicamentData.nombre,
                      precio: precioConvertido,
                      cantidad: cantidadConvertido,
                      nota: medicamentData.descripcion,
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class CardMedicamento extends StatelessWidget {
  final String nombre;
  final String precio;
  final String cantidad;
  final String nota;
  const CardMedicamento({
    super.key,
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.nota,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      width: 175,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 75,
            margin: EdgeInsets.only(top: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'lib/public/assets/images/img.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            nombre,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 3,
          ),
          TextoSeparado(
            izq: 'Cnt. Restante',
            drch: cantidad,
          ),
          TextoSeparado(
            izq: 'Precio',
            drch: precio,
          ),
          TextoSeparado(
            izq: 'Nota',
            drch: 'CUIDADO',
          ),
        ],
      ),
    );
  }
}

class TextoSeparado extends StatelessWidget {
  final String izq;
  final String drch;
  const TextoSeparado({
    super.key,
    required this.izq,
    required this.drch,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          izq,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          drch,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

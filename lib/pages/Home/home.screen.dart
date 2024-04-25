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
  final int limit = 6;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int limit = 6;
  bool _isLoading = false;
  List<Medicamento> _data = [];
  List<List<Medicamento>> datax = [];

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final appProvider = Provider.of<AppProvider>(context, listen: true);

      datax = List.generate(appProvider.categorias, (_) => []);

      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Medicamento').get();
      print(querySnapshot);

      List<Medicamento> combinedData = [];
      if (querySnapshot.docs.isNotEmpty) {
        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
          Medicamento medicament = Medicamento.fromDocument(doc);

          // Map<String, dynamic> medicament = doc.data() as Map<String, dynamic>;
          combinedData.add(medicament);
          int categoriaIndex = medicament.categoria - 1;
          if (categoriaIndex >= 0 && categoriaIndex < limit) {
            datax[categoriaIndex].add(medicament);
          }
        }
        print(combinedData);
        print("datax:");
        print(datax);
      }
      setState(() {
        if (mounted) {
          _data = combinedData;
        }
      });
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      print(datax);
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
                  child: Column(
                    children: [
                      TextoCentrado(
                        color: Colors.white,
                        h: 30,
                        w: double.infinity,
                        tap: 5,
                        texto: 'Vitrina #1',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 175,
                        child: _isLoading
                            ? Center()
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _data.length,
                                itemBuilder: (context, index) {
                                  var medicamentData = _data[index];
                                  String precioConvertido =
                                      medicamentData.precio.toString();
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

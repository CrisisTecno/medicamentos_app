import 'package:cloud_firestore/cloud_firestore.dart';

class Medicamento {
  final String nombre;
  final double precio;
  final int cantidad;
  final String descripcion;

  final String indicaciones;
  final Timestamp fechaDeActualizacion;
  final Timestamp fechaDeCreacion;
  final int categoria;

  Medicamento({
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.descripcion,
    required this.indicaciones,
    required this.categoria,
    required this.fechaDeActualizacion,
    required this.fechaDeCreacion,
  });

  factory Medicamento.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Medicamento(
      nombre: data['nombre'] ?? '',
      precio: (data['precio'] ?? 0.0).toDouble(),
      cantidad: data['cantidad'] ?? 0,
      descripcion: data['descripcion'] ?? '',
      indicaciones: data['indicaciones'] ?? '',
      fechaDeActualizacion: data['fechaDeActualizacion'] ?? Timestamp.now(),
      fechaDeCreacion: data['fechaDeCreacion'] ?? Timestamp.now(),
      categoria: data['categoria'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'precio': precio,
      'cantidad': cantidad,
      'descripcion': descripcion,
      'indicaciones': indicaciones,
      'categoria': categoria,
      'fechaDeActualizacion': fechaDeActualizacion,
      'fechaDeCreacion': fechaDeCreacion,
    };
  }
}

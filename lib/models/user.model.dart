import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final Timestamp createAt;
  final String password;
  final String nombre;
  final String rol;
  final String uid;

  UserModel({
    required this.email,
    required this.createAt,
    required this.password,
    required this.nombre,
    required this.rol,
    required this.uid,
  });

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return UserModel(
      email: data['email'] ?? '',
      createAt: data['createAt'] ?? Timestamp.now(),
      password: data['password'] ?? '',
      nombre: data['nombre'] ?? '',
      rol: data['rol'] ?? '',
      uid: data['uid'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'rol': rol,
      'createAt': createAt,
      'password': password,
      'nombre': nombre,
    };
  }
}

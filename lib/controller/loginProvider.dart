import 'package:flutter/material.dart';

class loginProvider with ChangeNotifier {
  // Map<String, dynamic>? _userData;
  // Map<String, dynamic>? _personData;
  // String? _userId;
  // String? _personId;
  String _user = '';
  String _puser = '';

  // String? get userId => _userId;
  // String? get personId => _personId;
  String get user => _user;
  String get puser => _puser;

  void setUserName(String user) {
    _user = user;
    notifyListeners();
  }

  void setPUser(String puser) {
    _puser = puser;
    notifyListeners();
  }

  // void setUserData(String userId, Map<String, dynamic> data) {
  //   _userData = data;
  //   _userId = userId;
  //   notifyListeners();
  // }

  // void setPersonComplete(Map<String, dynamic> data) {
  //   _personData = data;
  //   notifyListeners();
  // }

  // void setPersonData(String personId) {
  //   _personId = personId;
  //   notifyListeners();
  // }

  // void clearUserData() {
  //   _userData = null;
  //   _userId = null;
  //   _personId = null;
  //   notifyListeners();
  // }

  // Future<List<DocumentSnapshot>> getAllUsers() async {
  //   try {
  //     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //         .collection('Users')
  //         .where(FieldPath.documentId, isNotEqualTo: _userId)
  //         .get();
  //     print(querySnapshot.docs);
  //     return querySnapshot.docs;
  //   } catch (e) {
  //     print('Error fetching users: $e');
  //     return [];
  //   }
  // }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateData(
    String name,
    String staffId,
    String email,
    String role,
    
  ) async {
    return await usersCollection.doc(uid).set({
      'name': name,
      'staffId': staffId,
      'email': email,
      'Role': role,
      
    });
  }
}

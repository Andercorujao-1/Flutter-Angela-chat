import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AbstractController {
  String email = '';
  String password = '';

  Future<bool> login({
    //gets email and password, returns true if login sucessful
    required email,
    required password,
  });
  Future<bool> register({
    //gets email and password
    required email,
    required password,
  });
  void logout();
  void sendMessage({required message});
  Stream<QuerySnapshot>? getMessages();
}

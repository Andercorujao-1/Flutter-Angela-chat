import 'package:chat/interface.dart';
// import 'internal_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Controller implements AbstractController {
  @override
  String email = '';
  @override
  String password = '';
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  late final User user;

  // Map credentialsMap = {};
  // CredentialsData data = CredentialsData();

  // Controller() {
  //   getCredentials();
  // }

  // void getCredentials() async {
  //   credentialsMap = await data.getCredentials();
  // }

  // @override
  // bool login({required email, required password}) {
  //   bool sucessfullLogin = false;
  //   for (var v in credentialsMap.values) {
  //     if (v['Email'] == email && v['Password'] == password) {
  //       sucessfullLogin = true;
  //     }
  //   }
  //   return sucessfullLogin;
  // }

  // @override
  // void register({required email, required password}) {
  //   int numberCredentials = credentialsMap.length + 1;
  //   Map<String, dynamic> varToAdd = {
  //     'User$numberCredentials': {"Email": email, "Password": password}
  //   };
  //   credentialsMap.addAll(varToAdd);
  //   data.setCredentials(credentialsMap: credentialsMap);
  // }

  @override
  Future<bool> login({required email, required password}) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = auth.currentUser!;
      print(user.email);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> register({required email, required password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = auth.currentUser!;
      print(user.email);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  void logout() {
    auth.signOut();
  }

  @override
  void sendMessage({required message}) {
    //
    try {
      fireStore
          .collection('messages')
          .add({'text': message, 'sender': user.email});
    } catch (e) {
      print(e);
    }
  }

  @override
  Stream<QuerySnapshot>? getMessages() {
    return fireStore.collection('messages').snapshots();
  }
}

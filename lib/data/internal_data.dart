// import 'package:flutter/services.dart';
// import 'dart:convert';
// import 'dart:html' as html;

// class CredentialsData {
//   String filePathCredentials = 'lib/data/credentials.json';
//   Map<String, dynamic> credentialsMap = {};

//   Future<Map<String, dynamic>> getCredentials() async {
//     String jsonText = await rootBundle.loadString(filePathCredentials);
//     credentialsMap = json.decode(jsonText);
//     return credentialsMap;
//   }

//   void setCredentials({required Map credentialsMap}) {
//     print('before');
//     print(html.window.localStorage['myData']);

//     String newJsonString = jsonEncode(credentialsMap);
//     html.window.localStorage['myData'] = newJsonString;

//     print('after');
//     print(html.window.localStorage['myData']);
//     //
//   }
// }

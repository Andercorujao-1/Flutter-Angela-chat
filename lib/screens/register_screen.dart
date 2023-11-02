import 'package:flutter/material.dart';
import 'package:chat/interface.dart';
import 'package:get_it/get_it.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final GetIt getIt = GetIt.instance;
  late final AbstractController controller = getIt.get<AbstractController>();

  @override
  Widget build(BuildContext context) {
    String login = "";
    String password = "";
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('chat'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
//////////////////////////////////////////////////// container with title
          const SizedBox(
            width: double.infinity,
            child: Text(
              'FLASH CHAT',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 70,
          ),
/////////////////////////////////////////////////////text form fields
          SizedBox(
            width: screenWidth * 0.8,
            child: TextFormField(
              onChanged: (String? value) {
                value is String ? login = value : login = '';
              },
              decoration: const InputDecoration(hintText: 'Enter Your Email'),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: screenWidth * 0.8,
            child: TextFormField(
              onChanged: (String? value) {
                value is String ? password = value : password = '';
              },
              decoration:
                  const InputDecoration(hintText: 'Enter Your Password'),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
///////////////////////////////////////////////////// register button
          TextButton(
            onPressed: () async {
              BuildContext currentContext = context;
              bool sucess = await controller.register(
                email: login,
                password: password,
              );
              if (sucess == true) {
                Navigator.pushNamed(currentContext, 'Chat');
              } else {
                print('fail');
              }
            },
            child: Container(
              alignment: Alignment.center,
              width: screenWidth * 0.8,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.blue),
              child: const Text(
                'register',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

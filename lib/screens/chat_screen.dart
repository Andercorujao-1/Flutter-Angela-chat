import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chat/interface.dart';
import 'package:get_it/get_it.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final GetIt getIt = GetIt.instance;
  late final AbstractController controller = getIt.get<AbstractController>();
  @override
  Widget build(BuildContext context) {
    String message = '';
    return Scaffold(
      appBar: AppBar(title: const Text('chat')),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                controller.logout();
                Navigator.pushNamed(context, 'Login');
              },
              child: Text('logout')),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Column(
              children: [
                Text('test'),
                StreamBuilder<QuerySnapshot>(
                  stream: controller.getMessages(),
                  builder: (context, snap) {
                    List<Widget> textList = [];
                    if (snap.hasData) {
                      final messages = snap.data!.docs;
                      for (var m in messages) {
                        Map<String, dynamic> messageMap =
                            m.data() as Map<String, dynamic>;
                        textList.add(
                          Row(
                            children: [
                              Text(messageMap['text']),
                              Text('  --  '),
                              Text(messageMap['sender']),
                            ],
                          ),
                        );
                      }
                    }
                    return Column(
                      children: textList,
                    );
                  },
                )
              ],
            ),
          ),
          /////////////////////////////////////// text form field
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  onChanged: (String? value) {
                    value is String ? message = value : message = '';
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    controller.sendMessage(message: message);
                    print(message);
                  },
                  child: Text('send'))
            ],
          ),
          TextButton(
            onPressed: () {
              controller.getMessages();
              //
            },
            child: Text('getMessages'),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

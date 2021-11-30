import 'package:fcmchat/models/ChatMessage.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'chat_input_field.dart';
import 'message.dart';

class Body extends StatelessWidget {
  final Object arguments;
  Body({required this.arguments});

  @override
  Widget build(BuildContext context) {
    final args = arguments as Map<String, dynamic>;
    // ================================================ bagian print
    print("INI gua di body message");
    print(args['nama']);
    // ================================================ bagian print
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) =>
                  Message(message: demeChatMessages[index]),
            ),
          ),
        ),
        ChatInputField(arguments: arguments),
      ],
    );
  }
}

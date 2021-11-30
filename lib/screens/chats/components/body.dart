import 'package:fcmchat/components/filled_outline_button.dart';
import 'package:fcmchat/models/Chat.dart';
import 'package:fcmchat/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'chat_card.dart';
// import 'chat_card.dart';

class Body extends StatelessWidget {
  final Object arguments;
  Body({required this.arguments});

  @override
  Widget build(BuildContext context) {
    var darguments = arguments as Map<String, dynamic>;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
                chat: chatsData[index],
                press: () => {
                      darguments['topic'] = chatsData[index].topic,
                      Navigator.pushNamed(context, MessagesScreen.routesName,
                          arguments: darguments),
                    }),
          ),
        ),
      ],
    );
  }
}

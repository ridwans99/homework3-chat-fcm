import 'package:fcmchat/models/ChatMessage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);
  final String apiUrl = "https://api-chat-app-1.herokuapp.com/";

  void assignTopics(ChatMessage msg) {
    //expect processed form from the receiving end
    switch (msg.text) {
      default:
        log(msg.text);
        break;
    }
  }

  void broadcast(ChatMessage msg) {
    Map<String, String> content = {
      'message': msg.text,
    };
    log(apiUrl.toString());
    http.post(
      Uri.parse(apiUrl),
      body: content,
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

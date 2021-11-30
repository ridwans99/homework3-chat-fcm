import 'dart:convert';

import 'package:fcmchat/models/ChatMessage.dart';
import 'package:fcmchat/models/UserModel.dart';
// import 'package:fcmchat/models/CommentModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'body.dart';
import '../../constants.dart';

class Data {
  String title;
  String topic;
  String message;
  String nama;

  Data(this.title, this.topic, this.message, this.nama);

  Map toJson() =>
      {'title': title, 'topic': topic, 'message': message, 'nama': nama};
}

class ChatInputField extends StatefulWidget {
  final Object arguments;

  ChatInputField({required this.arguments});

  @override
  State<ChatInputField> createState() => _ChatInputFieldState(arguments);
  // _ChatInputFieldState createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  late TextEditingController commentController;

  final Object arguments;

  _ChatInputFieldState(this.arguments);

  @override
  void initState() {
    super.initState();
    commentController = TextEditingController();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  bool _showAttachment = false;

  void _updateAttachmentState() {
    setState(() {
      _showAttachment = !_showAttachment;
    });
  }

  postData(topic, message, nama) async {
    try {
      print(topic);
      print(message);
      print(nama);
      // Map<String, String> data = {
      //   "title": "New message from " + topic,
      //   "message": message,
      //   "topic": topic,
      // };
      Data data = Data("New Message come from " + topic, topic, message, nama);
      String jsonData = jsonEncode(data.toJson());
      // print("=======================================================");
      // print(data.runtimeType);
      // print("=======================================================");
      var response = await http.post(
          Uri.parse("https://api-chat-app-1.herokuapp.com/send-message-topic"),
          body: jsonData);
      // body: {
      //   "title": "New Message come from " + topic,
      //   "message": message,
      //   "data": 'hai',
      //   "topic": topic,
      // });
      // print(topic, message, nama);

      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = arguments as Map<String, dynamic>;
    // ================================================ bagian print
    print("INI gua ngirim message");
    print(args['nama']);
    // ================================================ bagian print
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: defaultPadding / 2,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -4),
                  blurRadius: 32,
                  color: Color(0xFF087949).withOpacity(0.08),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(Icons.mic, color: primaryColor),
                SizedBox(width: defaultPadding),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(width: defaultPadding / 4),
                      Expanded(
                        child: TextField(
                          controller: commentController,
                          decoration: InputDecoration(
                              hintText: "Type message",
                              suffixIcon: SizedBox(
                                width: 120,
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.send),
                                      color: Colors.blue[400],
                                      onPressed: () {
                                        // print(args['topic']);
                                        // print(commentController.text);
                                        // print(args['nama']);

                                        postData(
                                            args['topic'],
                                            commentController.text,
                                            args['nama']);
                                        // await http.post(
                                        //   Uri.parse(
                                        //       "https://api-chat-app-1.herokuapp.com/send-message-topic"),
                                        //   body: {"topic": topic},
                                        // );
                                        setState(() {
                                          demeChatMessages.insert(
                                              demeChatMessages.length,
                                              ChatMessage(
                                                text: commentController.text,
                                                messageType:
                                                    ChatMessageType.text,
                                                messageStatus:
                                                    MessageStatus.viewed,
                                                isSender: true,
                                              ));
                                        });
                                        commentController.clear();
                                        FocusScope.of(context)
                                            .requestFocus(new FocusNode());
                                      },
                                    ),
                                    InkWell(
                                      onTap: _updateAttachmentState,
                                      child: Icon(
                                        Icons.attach_file,
                                        color: _showAttachment
                                            ? primaryColor
                                            : Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .color!
                                                .withOpacity(0.64),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: defaultPadding / 2),
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color!
                                            .withOpacity(0.64),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

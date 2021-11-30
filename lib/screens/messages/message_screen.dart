import '../constants.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class MessagesScreen extends StatelessWidget {
  static const routesName = '/Message';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    // ================================================ bagian print
    print("GUA DI DALEM MESSAGE SCREEN!");
    print(args);
    // ================================================ bagian print
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(arguments: args!),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/pp.png"),
          ),
          const SizedBox(width: defaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Topic Sport",
                style: TextStyle(fontSize: 16),
              ),
              const Text(
                "Active 3m ago",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(icon: const Icon(Icons.local_phone), onPressed: () {}),
        IconButton(icon: const Icon(Icons.videocam), onPressed: () {}),
        const SizedBox(width: defaultPadding / 2),
      ],
    );
  }
}

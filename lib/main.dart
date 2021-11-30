import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fcmchat/screens/chats/chats_screen.dart';
import 'package:fcmchat/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'components/primary_button.dart';
import 'components/text_field.dart';
import 'screens/constants.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

late AndroidNotificationChannel? channel;

late FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  runApp(MyApp());
}

class Data {
  String token;
  String topic;

  Data(this.token, this.topic);

  Map toJson() => {'token': token, 'topic': topic};
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      routes: {
        ChatsScreen.routesName: (context) => ChatsScreen(),
        MessagesScreen.routesName: (context) => MessagesScreen(),
      },
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: MyHomePage(title: 'Chat App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _userController = TextEditingController(text: "");

  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin!.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel!.id,
                channel!.name,
                icon: 'launch_background',
              ),
            ));
      }
    });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    //   final Map<String, dynamic> data = message.data;

    //   log(data.toString(), name: 'data content ');
    //   final Message msg = Message(
    //     sender: data['user'],
    //     judul: data['judul'],
    //     isi: data['isi'],
    //   );

    //   log(msg.toString(), name: 'restructuredmessage');
    //   // chatController.assignTopics(msg);
    //   log('assigned topics', name: 'finished assigning topics ');
    //   // Navigator.pushNamed(context, '/message',
    //   //     arguments: MessageArguments(message, true));
    // });
    super.initState();
  }

  postData(token, topic) async {
    try {
      Data data = Data(token, topic);
      String jsonData = jsonEncode(data.toJson());
      var response = await http.post(
          Uri.parse("https://api-chat-app-1.herokuapp.com/subs-topic"),
          body: jsonData);

      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 120),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Masuk Chat Apps',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: fixsecondarycolor,
                    ),
                  ),
                ),
              ],
            ),
            Form(
                child: Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: LoginTextField(
                  focus: false,
                  correct: true,
                  obscure: false,
                  text: 'Nama Pengguna',
                  icon: Icons.person,
                  controller: _userController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama Pengguna tidak boleh kosong';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: PrimaryButton2(
                  text: 'Masuk',
                  press: () async {
                    String? token = await FirebaseMessaging.instance.getToken();
                    // print("Firebase token : $token");
                    postData(token, "Sport");
                    postData(token, "Game");
                    toChatsScreen();
                  },
                  color: fixmaincolor,
                  textColor: Colors.black,
                  width: size.width,
                  shadowColor: Colors.black,
                  borderColor: fixmaincolor,
                ),
              ),
            ])),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? token = await FirebaseMessaging.instance.getToken();
          print("Firebase token : $token");
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void toChatsScreen() {
    Navigator.pushNamed(context, ChatsScreen.routesName,
        arguments: {"nama": _userController.text});
  }
}

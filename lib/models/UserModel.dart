// import 'package:fcmchat/models/ChatMessage.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class MessageRepository {
//   final _baseUrl = 'https://api-chat-app-1.herokuapp.com/';

//   Future getData() async {
//     try {
//       final response = await http.get(Uri.parse(_baseUrl));

//       if (response.statusCode == 200) {
//         Iterable it = jsonDecode(response.body);
//         List<ChatMessage> dokumenmodel =
//             it.map((e) => ChatMessage.fromJson(e)).toList();
//         return dokumenmodel;
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }

// Future<UserModel> createUser(String name, String jobTitle) async{
//   final String apiUrl = "https://api-chat-app-1.herokuapp.com/";

//   final response = await http.post(Uri.parse(apiUrl));, body: {
//     "name": name,
//     "job": jobTitle
//   });

//   if(response.statusCode == 201){
//     final String responseString = response.body;
    
//     return userModelFromJson(responseString);
//   }else{
//     return null;
//   }
// }

// import 'dart:convert';

// UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

// String userModelToJson(UserModel data) => json.encode(data.toJson());

// class UserModel {
//   String title;
//   String msg;

//   UserModel({
//     required this.title,
//     required this.msg,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         title: json["title"],
//         msg: json["msg"],
//       );

//   Map<String, dynamic> toJson() => {
//         "msg": title,
//         "msg": msg,
//       };
// }
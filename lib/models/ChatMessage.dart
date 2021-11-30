enum ChatMessageType {
  text,
  image,
}
enum MessageStatus { not_sent, not_view, viewed }

class ChatMessage {
  final String text;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;

  ChatMessage({
    this.text = '',
    required this.messageType,
    required this.messageStatus,
    required this.isSender,
  });
}

List demeChatMessages = [
  ChatMessage(
    text: "Hai Ridwan,",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  // ChatMessage(
  //   text: "Hai, Apa kabar ?",
  //   messageType: ChatMessageType.text,
  //   messageStatus: MessageStatus.viewed,
  //   isSender: true,
  // ),
  // // ChatMessage(
  // //   text: "",
  // //   messageType: ChatMessageType.audio,
  // //   messageStatus: MessageStatus.viewed,
  // //   isSender: false,
  // // ),
  // // ChatMessage(
  // //   text: "",
  // //   messageType: ChatMessageType.video,
  // //   messageStatus: MessageStatus.viewed,
  // //   isSender: true,
  // // ),
  // ChatMessage(
  //   text: "Terjadi kesalahan",
  //   messageType: ChatMessageType.text,
  //   messageStatus: MessageStatus.not_sent,
  //   isSender: true,
  // ),
  // ChatMessage(
  //   text: "Alhamdulillah baik",
  //   messageType: ChatMessageType.text,
  //   messageStatus: MessageStatus.viewed,
  //   isSender: false,
  // ),
  // ChatMessage(
  //   text: "Syukurlah",
  //   messageType: ChatMessageType.text,
  //   messageStatus: MessageStatus.not_view,
  //   isSender: true,
  // ),
];

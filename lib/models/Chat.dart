class Chat {
  final String name, lastMessage, topic, image, time;
  final bool isActive;

  Chat({
    this.name = '',
    this.topic = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List chatsData = [
  Chat(
    name: "Topic Sport",
    lastMessage: "Hai Ridwan,",
    image: "assets/images/pp.png",
    time: "3m ago",
    topic: "Sport",
    isActive: false,
  ),
  Chat(
    name: "Topic Game",
    lastMessage: "Kuharap kau baik...",
    image: "assets/images/pp.png",
    time: "8m ago",
    topic: "Game",
    isActive: true,
  ),
  // Chat(
  //   name: "Lazuardy Khatulistiwa",
  //   lastMessage: "Login wan",
  //   image: "assets/images/pp.png",
  //   time: "5d ago",
  //   isActive: false,
  // ),
  // Chat(
  //   name: "Muhammad Ardani",
  //   lastMessage: "Main gak ?",
  //   image: "assets/images/pp.png",
  //   time: "5d ago",
  //   isActive: true,
  // ),
  // Chat(
  //   name: "Andri Rahmanto",
  //   lastMessage: "Thanks",
  //   image: "assets/images/pp.png",
  //   time: "6d ago",
  //   isActive: false,
  // ),
  // Chat(
  //   name: "Ahmad Al Jufri",
  //   lastMessage: "Lagi dimana lu ? ....",
  //   image: "assets/images/pp.png",
  //   time: "3m ago",
  //   isActive: false,
  // ),
  // Chat(
  //   name: "Khulaifi Al Katsiri",
  //   lastMessage: "Main gak ?",
  //   image: "assets/images/pp.png",
  //   time: "8m ago",
  //   isActive: true,
  // ),
  // Chat(
  //   name: "Gian Chiesa",
  //   lastMessage: "Login wan",
  //   image: "assets/images/pp.png",
  //   time: "5d ago",
  //   isActive: false,
  // ),
];

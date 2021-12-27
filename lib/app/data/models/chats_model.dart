class ChatModel {
  late String chattext;
  late String dateTime;
  late String receiverId;
  late String senderId;

  ChatModel({
    required this.chattext,
    required this.dateTime,
    required this.receiverId,
    required this.senderId,
  });

  ChatModel.fromjson(Map<String, dynamic> json) {
    chattext = json['chattext'];
    dateTime = json['dateTime'];
    receiverId = json['receiverId'];
    senderId = json['senderId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'chattext': chattext,
      'receiverId': receiverId,
      'senderId': senderId,
      'dateTime': dateTime,
    };
  }
}

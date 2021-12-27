class MessageModel {
  late String uId;
  late String profileImage;
  late String name;
  late String message;
  late DateTime createdAt;

  MessageModel({
    required this.uId,
    required this.profileImage,
    required this.name,
    required this.message,
    required this.createdAt,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'];
    profileImage = json['profileImage'];
    name = json['name'];
    message = json['message'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'profileImage': profileImage,
      'name': name,
      'message': message,
      'createdAt': createdAt,
    };
  }
}

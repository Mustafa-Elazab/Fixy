class UserModel {
  late String name;
  late String email;
  String? phone;
  late String profileImage;
  late String uId;

  UserModel({
    required this.name,
    required this.email,
    this.phone,
    required this.profileImage,
    required this.uId,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    profileImage = json['profileImage'];

    uId = json['uId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'uId': uId,
      'email': email,
      'phone': phone,
      'profileImage': profileImage,
    };
  }
}

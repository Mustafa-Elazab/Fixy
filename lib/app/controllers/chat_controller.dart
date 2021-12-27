import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixy/app/data/models/users_model.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  List<UserModel> listUserModel = [];
  void getAllUsers() {
    if (listUserModel.isEmpty) {
      FirebaseFirestore.instance.collection('users').get().then((value) {
        for (var element in value.docs) {
          if (element.data()['uId'] != FirebaseAuth.instance.currentUser!.uid) {
            listUserModel.add(UserModel.fromJson(element.data()));
            update();
          }
        }
      }).catchError((error) {});
    }
  }

  @override
  void onInit() {
    getAllUsers();
    // TODO: implement onInit
    super.onInit();
  }

  // void sentMessage({
  //   required String dateTime,
  //   required String receiverId,
  //   required String message,
  // }) {
  //   ChatModel chatModel = ChatModel(
  //     chattext: message,
  //     dateTime: dateTime,
  //     receiverId: receiverId,
  //     senderId: uId,
  //   );

  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uId)
  //       .collection('chats')
  //       .doc(receiverId)
  //       .collection('messages')
  //       .add(chatModel.toMap())
  //       .then((value) {
  //     // emit(SendMessageSucessState());
  //   }).catchError((error) {
  //     // emit(SendMessageErrorState(error.toString()));
  //   });

  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(receiverId)
  //       .collection('chats')
  //       .doc(uId)
  //       .collection('messages')
  //       .add(chatModel.toMap())
  //       .then((value) {
  //     // emit(SendMessageSucessState());
  //   }).catchError((error) {
  //     //emit(SendMessageErrorState(error.toString()));
  //   });
  // }

  // List<ChatModel> listChatModel = [];

  // void getMessage({required receiverId}) {
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uId)
  //       .collection('chats')
  //       .doc(receiverId)
  //       .collection('messages')
  //       .orderBy('dateTime')
  //       .snapshots()
  //       .listen((event) {
  //     listChatModel = [];
  //     event.docs.forEach((element) {
  //       listChatModel.add(ChatModel.fromjson(element.data()));
  //       var data = element.data();
  //       print(data);
  //     });
  //     // emit(ReceiveMessageSucessState());
  //   });
  // }

  // QuerySnapshot<Map<String, dynamic>> snapshotData;
  // Future getSearchResult(String search) async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .where('name', isGreaterThanOrEqualTo: search)
  //       .get()
  //       .then((value) {
  //     snapshotData = value;
  //     print(snapshotData.docs.length);
  //     // emit(GetSearchResultSucessState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     //    emit(GetSearchResultErrorState());
  //   });
  // }
}

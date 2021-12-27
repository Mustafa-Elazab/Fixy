import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixy/app/data/models/users_model.dart';

class FireStore {
  final CollectionReference userRef =
      FirebaseFirestore.instance.collection("Users");

  final CollectionReference _categoeriesRef =
      FirebaseFirestore.instance.collection("Category");

  Future<void> addUserToFireStore(UserModel userModel) async {
    await userRef.doc(userModel.uId).set(userModel.toJson());
  }

  Future<List<QueryDocumentSnapshot>> getCategories() async {
    var categoriesData = await _categoeriesRef.get();
    return categoriesData.docs;
  }
}

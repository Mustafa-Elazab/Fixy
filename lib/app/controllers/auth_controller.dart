import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixy/app/data/models/users_model.dart';
import 'package:fixy/app/data/services/firestore.dart';
import 'package:fixy/app/data/services/sharepreference.dart';
import 'package:fixy/app/ui/pages/auth_page.dart';
import 'package:fixy/app/ui/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  // FacebookLogin _facebookLogin = FacebookLogin();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late final String? email, password, name;

  void googleSignInMethods() async {
    final GoogleSignInAccount? _googleSignInAccount =
        await _googleSignIn.signIn();

    GoogleSignInAuthentication _googleSignInAuthention =
        await _googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: _googleSignInAuthention.idToken,
        accessToken: _googleSignInAuthention.accessToken);

    UserCredential userCredential =
        await _auth.signInWithCredential(credential).then((user) {
      saveUserData(user);
      Get.offAll((() => MainPage()));
      return user;
    });
    print(userCredential);
  }

  // void facebookSignInMethods() async {
  //   FacebookLoginResult _facebookLoginResult =
  //       await _facebookLogin.logIn(['email']);

  //   final accessToken = _facebookLoginResult.accessToken.token;

  //   if (_facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
  //     final AuthCredential credential =
  //         FacebookAuthProvider.credential(accessToken);
  //     _auth.signInWithCredential(credential).then((user) {
  //       saveUserData(user);
  //       Get.offAll((() => HomePage()));
  //     });
  //   }
  // }

  void signInWihEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((user) {
        saveUserData(user);
        print(user);
        CacheHelper.saveData(key: 'uId', value: user.user!.uid);
      });
      Get.snackbar('Sucessful Signin account', '.',
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.black);
      Get.off(() => MainPage());
    } catch (e) {
      Get.snackbar('Error login account', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signUpWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        saveUserData(user);
        print(user);
        await CacheHelper.saveData(key: 'uId', value: user.user!.uid);
      });
      Get.snackbar('Sucessful creating account', '.',
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.black);
      Get.off(() => const AuthPage());
    } catch (e) {
      print(e);
      Get.snackbar('Error register account', e.toString(),
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.black);
    }
  }

  void saveUserData(UserCredential user) async {
    await FireStore().addUserToFireStore(UserModel(
        name: name!,
        email: user.user!.email!,
        profileImage: profileImageUrl,
        uId: user.user!.uid));
  }

  bool obscureText = true;
  IconData passwordIcon = Icons.visibility_off_outlined;
  void changePassworSecure() {
    obscureText = !obscureText;
    passwordIcon =
        obscureText ? Icons.visibility_off_outlined : Icons.visibility_rounded;
    update();
  }

  File? profileImage;
  final picker = ImagePicker();
  Future getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      print(profileImage.toString());
      uploadProfileImage();
      update();
    } else {
      print('No image selected.');
    }
  }

  String profileImageUrl = '';
  void uploadProfileImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        profileImageUrl = value;
        update();
        print(value);
      }).catchError((error) {});
    }).catchError((error) {
      print(error.toString());
    });
  }
}

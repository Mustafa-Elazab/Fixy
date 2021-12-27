import 'dart:convert';

import 'package:fixy/app/data/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper extends GetxController {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData(
      {required String key, @required dynamic value}) async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);
    return await sharedPreferences!.setDouble(key, value);
  }

  static dynamic getData({
    @required String? key,
  }) async {
    return sharedPreferences!.get(key!);
  }

  static Future<bool> removeData() {
    return sharedPreferences!.clear();
  }

  static setUser(UserModel userModel) async {
    await sharedPreferences!.setString('user', json.encode(userModel.toJson()));
  }

  static getUser() async {
    var value = sharedPreferences!.getString('user');
    return UserModel.fromJson(json.decode(value!));
  }

  Future<UserModel?> get getUserData async {
    try {
      UserModel userModel = await getUser();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

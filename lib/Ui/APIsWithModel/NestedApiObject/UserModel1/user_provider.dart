import 'dart:convert';

import 'package:apitesting2/Ui/APIsWithModel/Model/NestedModel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProviderWithoutModel extends ChangeNotifier {
  List<UserModel> userList = [];

  Future<List<UserModel>> userData() async {
    final res =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    final maxData = jsonDecode(res.body.toString());

    if (res.statusCode == 200) {
      for (var data in maxData) {
        print(data['name']);
        userList.add(UserModel.fromJson(data));
      }
      notifyListeners();
      return userList;
    } else {
      return userList;
    }
  }
}

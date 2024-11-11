import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  var data;

  Future<void> getuserData() async {
    final res =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (res.statusCode == 200) {
      data = jsonDecode(res.body.toString());
    }
  }
}

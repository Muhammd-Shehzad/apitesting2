import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProviderWithoutModel extends ChangeNotifier {
  Future<void> getUserData() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    var maxdata;
    if (res.statusCode == 200) {
      maxdata = jsonDecode(res.body.toString());
    } else {}
  }
}

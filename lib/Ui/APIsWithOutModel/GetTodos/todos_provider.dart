import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodosProvider extends ChangeNotifier {
  var data;
  Future<void> getTodosData() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );

    if (res.statusCode == 200) {
      data = jsonDecode(res.body.toString());
    }
  }
}

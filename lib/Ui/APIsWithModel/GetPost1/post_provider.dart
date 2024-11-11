import 'dart:convert';

import 'package:apitesting2/Model/Post_model1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostProvider extends ChangeNotifier {
  List<PostModel1> listName = [];

  Future<List<PostModel1>> getPostData() async {
    var res =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    var maxData = jsonDecode(res.body.toString());

    if (res.statusCode == 200) {
      for (var data in maxData) {
        listName.add(PostModel1.fromJson(data));
      }
      notifyListeners();
      return listName;
    } else {
      return listName;
    }
  }
}

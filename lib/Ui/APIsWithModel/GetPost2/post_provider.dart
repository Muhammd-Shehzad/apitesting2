import 'dart:convert';

import 'package:apitesting2/Ui/APIsWithModel/Model/post_model2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostProvider extends ChangeNotifier {
  List<PostModel2> listName = [];

  Future<List<PostModel2>> getPostData() async {
    var res = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1/comments'));

    var maxData = jsonDecode(res.body.toString());

    if (res.statusCode == 200) {
      for (var data in maxData) {
        listName.add(PostModel2.fromJson(data));
      }
      notifyListeners();
      return listName;
    } else {
      return listName;
    }
  }
}

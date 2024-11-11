import 'dart:convert';

import 'package:apitesting2/Model/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CommentProvider extends ChangeNotifier {
  List<CommentModel> commentList = [];

  Future<List<CommentModel>> getCommentData() async {
    var res = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

    var maxData = jsonDecode(res.body.toString());

    if (res.statusCode == 200) {
      for (var data in maxData) {
        commentList.add(CommentModel.fromJson(data));
      }
      notifyListeners();

      return commentList;
    } else {
      return commentList;
    }
  }
}

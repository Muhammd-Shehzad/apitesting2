import 'dart:convert';

import 'package:apitesting2/Ui/APIsWithModel/Model/photo_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhotoProvider extends ChangeNotifier {
  List<PhotoModel> photoList = [];

  Future<List<PhotoModel>> getPhoto() async {
    var res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );

    var maxData = jsonDecode(res.body.toString());

    if (res.statusCode == 200) {
      for (var data in maxData) {
        PhotoModel photos = PhotoModel(
            title: data['title'],
            thumbnailUrl: data['thumbnailUrl'],
            id: data['id']);

        photoList.add(photos);
      }
      notifyListeners();
      return photoList;
    } else {
      return photoList;
    }
  }
}

import 'dart:convert';

import 'package:apitesting2/Ui/APIsWithModel/Model/zaheenapp_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  List<ZaheenApp> appList = [];

  Future<List<ZaheenApp>> getData() async {
    var res = await http
        .get(Uri.parse('https://api.zaheen.com.pk/api/fetchByTableName/2/1'));

    var uriData = jsonDecode(res.body.toString());
    if (res.statusCode == 200) {
      for (var data in uriData) {
        ZaheenApp appData = ZaheenApp(
            thumbnail: data['thumbnail'],
            thumbnailUrl: data['thumbnailUrl'],
            name: data['name']);
        appList.add(appData);
      }
      notifyListeners();
      return appList;
    } else {
      return appList;
    }
  }
}

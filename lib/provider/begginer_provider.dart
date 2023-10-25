import 'dart:convert';

import 'package:android___tutorial/modal/begginer_list_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BeginnerProvider extends ChangeNotifier {

  List<BeginnerListModal> ?beginner_list;
  getResponse() async {
    try {
      var uri = await http.get(Uri.parse(
          'https://mapi.trycatchtech.com/v3/android_tutorials/beginner_list'));
      if (uri.statusCode == 200) {
        var response = jsonDecode(uri.body);
        beginner_list=BeginnerListModal.getBeginnerList(response).cast<BeginnerListModal>();

        notifyListeners();
        print(response);
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {}
  }
}

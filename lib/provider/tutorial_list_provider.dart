import 'dart:convert';

import 'package:android___tutorial/modal/tutorial_list_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TutorialListProvider extends ChangeNotifier {
  List? newresponse;
  List<TutorialListModal>? tutorial_list;

  var response;
 

  getResponse() async {
    try {
      var uri = await http.get(Uri.parse(
          "http://mapi.trycatchtech.com/v3/android_tutorials/tutorial_list"));
      if (uri.statusCode == 200) {
        response = jsonDecode(uri.body);

        print(response);
        newresponse = TutorialListModal.getTutorialList(response)
            .cast<TutorialListModal>();
        tutorial_list =
            newresponse!.reversed.cast<TutorialListModal>().toList();
        notifyListeners();
        print(tutorial_list![0].title);
      }
    } catch (e) {
      print(e);
    }
  }
}

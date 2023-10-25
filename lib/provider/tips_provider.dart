import 'dart:convert';
import 'package:android___tutorial/modal/tutorial_tips_modal.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class TipsProvider extends ChangeNotifier{
List<TutorialTipsModal>? tipsList;
  getresponse()async{

    try{
     var uri = await http.get(Uri.parse(
        'http://mapi.trycatchtech.com/v3/android_tutorials/good_practice_list'));
    if (uri.statusCode == 200) {
    var  response = jsonDecode(uri.body);
tipsList=TutorialTipsModal.getTutorialList(response).cast<TutorialTipsModal>();
notifyListeners();
      print(response);
      

      
    } else {
      throw Exception('Failed to fetch data');
    }

    }catch(e){
print(e);
    }
  }
}
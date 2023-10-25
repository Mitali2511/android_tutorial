import 'dart:convert';

import 'package:android___tutorial/modal/tutorial_tips_modal.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TipsGetxController extends GetxController {
  List<TutorialTipsModal>? tips_list;
  int index = 0;
  getResponse() async {
    tips_list=null;
    try {
      var uri = await http.get(Uri.parse(
          "http://mapi.trycatchtech.com/v3/android_tutorials/good_practice_list"));
      if (uri.statusCode == 200) {
        var response = jsonDecode(uri.body);
        print("------------Tips  Response--------------------");
        print(response);
        tips_list = TutorialTipsModal.getTutorialList(response)
            .cast<TutorialTipsModal>();
        // print(tips_list![index].tips);
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  String tip = 'tips';
  onNext() {
    index++;
    tip = tips_list![index].tips!;
    print(index);
    update();
  }
}

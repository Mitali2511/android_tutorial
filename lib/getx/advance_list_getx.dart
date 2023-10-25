import 'dart:convert';

import 'package:android___tutorial/modal/advance_list_modal.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class AdvanceListGetx extends GetxController {
  List<AdvanceListmodle>? advance_list;

  getResponse() async {
    try {
      var uri = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/android_tutorials/advance_list"));
      if (uri.statusCode == 200) {
        var response = jsonDecode(uri.body);
        print("------------Advance List Response--------------------");
        print(response);

        advance_list =
            AdvanceListmodle.getAdvacneList(response).cast<AdvanceListmodle>();
        

        update();
      }
    } catch (e) {
      print(e);
    }
  }
}

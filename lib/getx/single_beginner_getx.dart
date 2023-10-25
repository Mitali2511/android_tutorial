import 'dart:convert';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class SingleBeginnerGetxController extends GetxController {
  Map? single_beginner;
  var response;
  getResponse(var index) async {

    single_beginner = null;

    try {
      var uri = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/android_tutorials/single_beginner?beginner_id=${index}"));
     
      if (uri.statusCode == 200) {
        response = jsonDecode(uri.body);
       
       
        print("------------Single Beginner Response--------------------");
        print(response);
        print(response["id"]);

        update();
      }
    } catch (e) {
      print(e);
    }
  }
}

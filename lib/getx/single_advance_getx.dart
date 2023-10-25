import 'dart:convert';
import 'package:android___tutorial/modal/java_data_model.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class SingleAdvanceGetxController extends GetxController {
  List<JavaDataModel>? data_list;
 
  var response;
  getResponse(var index) async {
    data_list = null;
  
    try {
      var uri = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/android_tutorials/single_advance?advance_id=${index}"));

      if (uri.statusCode == 200) {
        response = jsonDecode(uri.body);
        print("------------Advance Single Response--------------------");
        print(response);

        data_list = JavaDataModel.getJAvaData(response['java_data'])
            .cast<JavaDataModel>();
        print(data_list!.length);
        data_list =
            JavaDataModel.getJAvaData(response['xml_data']).cast<JavaDataModel>();
        print(data_list!.length);
        

        update();
      }
    } catch (e) {
      print(e);
    }
  }


}

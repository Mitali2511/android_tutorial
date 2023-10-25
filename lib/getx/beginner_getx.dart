import 'dart:convert';

import 'package:android___tutorial/modal/begginer_list_modal.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class BeginnerGetxController extends GetxController{
List<BeginnerListModal>? beginner_list;
  getResponse()async{
    beginner_list=null;
    try{

      var uri= await http.get(Uri.parse("https://mapi.trycatchtech.com/v3/android_tutorials/beginner_list"));
      if(uri.statusCode==200){
        var response=jsonDecode(uri.body);
        print("------------ Beginner List Response--------------------");
        print(response);
        beginner_list=BeginnerListModal.getBeginnerList(response).cast<BeginnerListModal>();
        update();


      }
    }
    catch(e){
      print(e);
    }
  }
}
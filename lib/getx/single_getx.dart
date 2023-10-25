import 'package:get/get.dart';
import 'dart:convert';

import 'package:html/parser.dart' as htmlParser;

import 'package:http/http.dart' as http;

class SingleTutorialGetController extends GetxController {
  var result;
  var response;
 String? newDescription;
  getResponse({var index}) async {
    response = await http.get(Uri.parse(
        'https://mapi.trycatchtech.com/v3/android_tutorials/single_tutorial?tutorial_id=${index}'));
    if (response.statusCode == 200) {
      result = jsonDecode(response.body);
      print("------------Single Tutorial Response--------------------");

      print(result);
      
      newDescription=result['description'].toString().replaceAll('<p>&nbsp;</p>', '');
      print(newDescription);


      fetchAndParseData(apiResponse:newDescription);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  List<String>? imageLinks;
  List? description;
  List list = [];

  onAndroidIntroPop() {
    description = null;
    list.clear();
    imageLinks==null;
    index=0;
    update();
  }

  int index = 0;

  fetchAndParseData({var apiResponse}) async {
    list.clear();
    try {
      final imagePattern = RegExp(r'(?<=src=")[^"]+');
      final matches = imagePattern.allMatches(apiResponse);

      imageLinks =
          matches.map((match) => match.group(0)).cast<String>().toList();

      final document = htmlParser.parse(apiResponse);

      description = document.querySelectorAll('p');
//       List des_2=[];
//       for(var para in description!){
//         if(para.text.isNotEmpty && para.nodes.first.contains(' ')){
// des_2.add(para);
// print(para.nodes);
//         }
        

    //  }
      for (var paragraph in description!) {
        print("inside for ");
        print(index);
        if (paragraph.text.trim().isNotEmpty ) {
          list.add(paragraph.text);
          print("added text");
        } else {
          if(index<imageLinks!.length) {
            list.add(imageLinks![index]);
          }
          print("added image");
          index++;
          print("index");
          print(index);
        }
      }
      print(list.length);

      update();
    } catch (e) {
      print('Error: $e');
    }
  }
}

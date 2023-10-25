import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:html/parser.dart' as htmlParser;

import 'package:http/http.dart' as http;

class AndroidIntroProvider extends ChangeNotifier {
  var result;
  var response;

  getResponse({var index}) async {
    response = await http.get(Uri.parse(
        'https://mapi.trycatchtech.com/v3/android_tutorials/single_tutorial?tutorial_id=${index}'));
    if (response.statusCode == 200) {
      result = jsonDecode(response.body);

      print(result);

      fetchAndParseData(apiResponse: result["description"]);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  List<String>? imageLinks;
  List? description;


    onAndroidIntroPop(){
      description=null;
      notifyListeners();
    }

 fetchAndParseData( {var apiResponse})  {
    try {
    
      final imagePattern = RegExp(r'/[\w\d]+\.png');
      final matches = imagePattern.allMatches(apiResponse);

      imageLinks =
          matches.map((match) => match.group(0)).cast<String>().toList();

           final document = htmlParser.parse(apiResponse);

    description = document.querySelectorAll('p');
    for (var paragraph in description!) {
      print(paragraph.text);

    }
    notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }

}

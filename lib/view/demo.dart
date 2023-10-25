import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import 'package:http/http.dart' as http;

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  var text;

  @override
  void initState() {
    fetchAndParseData();
    super.initState();
  }

  fetchApiData() async {
    var response = await http.get(Uri.parse(
        'https://mapi.trycatchtech.com/v3/android_tutorials/single_tutorial?tutorial_id=5'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      text = result["description"];
      print(result);

      //var description=result[]
      return text;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  List<String>? imageLinks;
  List<String> textLinks = [];
  List<String>? description;

  Future<void> fetchAndParseData() async {
    try {
      final apiResponse = await fetchApiData();
      final imagePattern = RegExp(r'(?<=src=")[^"]+');
      final matches = imagePattern.allMatches(apiResponse);
      

      imageLinks =
          matches.map((match) => match.group(0)).cast<String>().toList();

      
      print(imageLinks![0]);

      //  print(extractedText);
      setState(() {});
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
body:Column(
  children: [
    HoverContainer(
                  width: 200,
                  height: 200,
                  hoverHeight: 220,
                  hoverWidth: 220,
                  color: Colors.red,
                  hoverColor: Colors.green,
                )
  ],
)
    );
  }
}

import 'package:flutter/material.dart';


class demo2 extends StatefulWidget {
  const demo2({super.key});

  @override
  State<demo2> createState() => _demo2State();
}

class _demo2State extends State<demo2> {
// var controller = WebViewController();
 @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HTML Viewer'),
        ),
       // body: WebViewWidget(controller: controller),
      
    );
  }
}
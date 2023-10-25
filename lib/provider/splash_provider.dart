import 'dart:async';

import 'package:android___tutorial/view/home_screen.dart';
import 'package:flutter/material.dart';

class SplashProvier extends ChangeNotifier {
  Timer? time;

  getloginvalues(BuildContext context) {
    time = Timer.periodic(Duration(seconds: 3), (timer) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }
}

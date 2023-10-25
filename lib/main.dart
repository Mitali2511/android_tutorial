import 'package:android___tutorial/view/advance_list_screen.dart';
import 'package:android___tutorial/view/begginer_screen.dart';
import 'package:android___tutorial/view/interview_screen.dart';
import 'package:android___tutorial/view/singal_tutorial_screen.dart';
import 'package:android___tutorial/view/home_screen.dart';
import 'package:android___tutorial/view/single_advance_screen.dart';
import 'package:android___tutorial/view/single_beginner_screen.dart';
import 'package:android___tutorial/view/splash_screen.dart';
import 'package:android___tutorial/view/tips_screen.dart';
import 'package:android___tutorial/view/tutorial_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 98, 193, 101))),
      getPages: [
        GetPage(name: "/", page: () => const SplashScreen(),),
        GetPage(name: "/home", page: () =>  HomeScreen(),),
        GetPage(name: "/tips", page: () =>  TipsScreen(),),
        GetPage(name: "/tutorialList", page: () =>  TutorialListScreen(),),
        GetPage(name: "/singleTutorial", page: () => SingleTutorialScreen(),),
        GetPage(name: "/beginnerList", page: () =>  BeginnerScreen(),),
        GetPage(name: "/singleBeginner", page: () =>  SingleBeginnerScreen(),),  
        GetPage(name: "/advanceList", page: () =>  AdvanceScreen(),),  
        GetPage(name: "/singleAdvance", page: () =>  SingleAdvanceScreen(),), 
        GetPage(name: "/interview", page: () =>  InterviewScreen(),), 
      ],
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
    
  }
}

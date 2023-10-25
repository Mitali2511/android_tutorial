import 'package:android___tutorial/getx/advance_list_getx.dart';
import 'package:android___tutorial/getx/beginner_getx.dart';
import 'package:android___tutorial/getx/home_getx.dart';
import 'package:android___tutorial/getx/interview_getx.dart';
import 'package:android___tutorial/getx/tips_getx.dart';
import 'package:android___tutorial/getx/tutorial_list_getx.dart';
import 'package:android___tutorial/modal/home_title_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TutorialListGetxController t = Get.put(TutorialListGetxController());

  final AdvanceListGetx a = Get.put(AdvanceListGetx());

  final TipsGetxController tips = Get.put(TipsGetxController());

  final BeginnerGetxController b = Get.put(BeginnerGetxController());

  final InterviewGetxController i = Get.put(InterviewGetxController());

  final HomeGetxController h = Get.put(HomeGetxController());

  @override
  Widget build(BuildContext context) {
    List<HomeTitles> titles = [
      HomeTitles(
          ontap: () {
            t.getResponse();
            Get.toNamed("/tutorialList");
          },
          title: "Android Tutorials"),
      HomeTitles(
          ontap: () {
            b.getResponse();
            Get.toNamed(
              "/beginnerList",
            );
          },
          title: "Begginers"),
      HomeTitles(
          ontap: () {
            a.getResponse();
            Get.toNamed("/advanceList");
          },
          title: "Advance"),
      HomeTitles(
          ontap: () {
            i.getResponse();
            Get.toNamed("/interview");
          },
          title: "Interview Questions"),
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text("Android Tutorial"),
          centerTitle: true,
          actions: [
            GestureDetector(
                onTap: () {
                  tips.getResponse();
                  
                   Get.toNamed("/tips");
                 
                },
                child: const Icon(Icons.emoji_objects)),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: GetBuilder<HomeGetxController>(builder: (controller) {
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  titles[index].ontap!();
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                    ),
                    Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromARGB(255, 46, 56, 46))),
                        child: Center(
                            child: Text(
                          "${titles[index].title}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ))),
                  ],
                ),
              );
            },
          );
        }));
  }
}

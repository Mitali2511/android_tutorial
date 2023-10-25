import 'package:android___tutorial/getx/single_beginner_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/tips_getx.dart';


class SingleBeginnerScreen extends StatelessWidget {
   SingleBeginnerScreen({super.key});
  final TipsGetxController tips = Get.put(TipsGetxController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //s.onAndroidIntroPop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("${Get.arguments}"),
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
        body: GetBuilder<SingleBeginnerGetxController>(builder: (controller) {
          return controller.response == null
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green)),
                        child: Text(
                          "${controller.response['xml']}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}

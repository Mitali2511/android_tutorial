import 'package:android___tutorial/getx/single_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/tips_getx.dart';

class SingleTutorialScreen extends StatelessWidget {
  final String? title;
  SingleTutorialScreen({this.title, super.key});
  final SingleTutorialGetController s = Get.put(SingleTutorialGetController());
  final TipsGetxController tips = Get.put(TipsGetxController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        s.onAndroidIntroPop();
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
        body: GetBuilder<SingleTutorialGetController>(builder: (controller) {
          return controller.list.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title:
                          controller.list[index].toString().contains('http')
                              ? Image.network("${controller.list[index]}")
                              : Text(
                                  controller.list[index].toString(),
                                 
                                ),
                    );
                  },
                );
        }),
      ),
    );
  }
}

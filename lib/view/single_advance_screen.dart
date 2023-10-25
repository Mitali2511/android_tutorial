import 'package:android___tutorial/getx/single_advance_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/tips_getx.dart';

class SingleAdvanceScreen extends StatelessWidget {
   SingleAdvanceScreen({super.key});
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
        body: GetBuilder<SingleAdvanceGetxController>(builder: (controller) {
          return controller.data_list == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  padding: EdgeInsets.all(15),
                  itemCount: controller.data_list!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${controller.data_list![index].fileName}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green)
                          ),

                          child: Text("${controller.data_list![index].code}")),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  },
                );
        }),
      ),
    );
  }
}

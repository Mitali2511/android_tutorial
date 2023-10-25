import 'package:android___tutorial/getx/tutorial_list_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/single_getx.dart';
import '../getx/tips_getx.dart';

class TutorialListScreen extends StatelessWidget {
   TutorialListScreen({super.key});
final TipsGetxController tips = Get.put(TipsGetxController());
final SingleTutorialGetController s=Get.put(SingleTutorialGetController());

  @override
  Widget build(BuildContext context) {
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
            )
          ],
        ),
        body: GetBuilder<TutorialListGetxController
        >(
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                controller.newresponse==null
                    ? const Center(child: CircularProgressIndicator())
                    : controller.tutorial_list!.isEmpty
                        ? const Text("No data Found")
                        : Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.all(12),
                              itemCount: controller.tutorial_list!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                     s .getResponse(
                                              index: controller.tutorial_list![index]
                                                  .id,);
                                      Get.toNamed("/singleTutorial",arguments: "${controller.tutorial_list![index].title}");
                                    },
                                    child: Column(
                                      children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Color.fromARGB(255, 8, 38, 9))
                                      ),
                                      child: ListTile(
                                        contentPadding: const EdgeInsets.all(15),
                                        trailing: const Icon(Icons.arrow_forward),
                                        iconColor: Colors.green,
                                        title: Text(
                                          "${controller.tutorial_list![index].title}",
                                          style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    )
                                      ],
                                    ));
                              },
                            ),
                          )
              ],
            );
          }
        ));
  }
}

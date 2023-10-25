import 'package:android___tutorial/getx/beginner_getx.dart';
import 'package:android___tutorial/getx/single_beginner_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';

import '../getx/tips_getx.dart';

class BeginnerScreen extends StatefulWidget {
  BeginnerScreen({super.key});

  @override
  State<BeginnerScreen> createState() => _BeginnerScreenState();
}

class _BeginnerScreenState extends State<BeginnerScreen> {
  final SingleBeginnerGetxController s =
      Get.put(SingleBeginnerGetxController());
final TipsGetxController tips = Get.put(TipsGetxController());
  bool color = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Begginers Tutorial"),
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
      body: GetBuilder<BeginnerGetxController>(builder: (controller) {
        return controller.beginner_list == null
            ? const Center(child: CircularProgressIndicator())
            : controller.beginner_list!.isEmpty
                ? const Text("No data found")
                : ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: controller.beginner_list!.length,
                    itemBuilder: (context, index) {
                      return HoverContainer(hoverColor: Colors.green,
                        child: Card(
                          color: Color.fromARGB(255, 192, 216, 193),
                          elevation: 3,
                          child: ListTile(
                            trailing: Icon(Icons.arrow_forward),
                              hoverColor:
                                  color ? Colors.greenAccent : Colors.transparent,
                              onTap: () {
                                s.getResponse(
                                    controller.beginner_list![index].id);
                                Get.toNamed("/singleBeginner",
                                    arguments:
                                        "${controller.beginner_list![index].title}");
                              },
                              title: Text(
                                "${controller.beginner_list![index].title}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )),
                        ),
                      );
                    },
                  );
      }),
    );
  }
}

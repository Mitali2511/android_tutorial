import 'package:android___tutorial/getx/advance_list_getx.dart';
import 'package:android___tutorial/getx/single_advance_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/tips_getx.dart';

class AdvanceScreen extends StatelessWidget {
   AdvanceScreen({super.key});

final  SingleAdvanceGetxController s=Get.put(SingleAdvanceGetxController());
final TipsGetxController tips = Get.put(TipsGetxController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 245, 222),
      appBar: AppBar(
        title: const Text("Advance"),
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
      body: GetBuilder<AdvanceListGetx>(builder: (controller) {
        return controller.advance_list == null
            ? const Center(child: CircularProgressIndicator())
            : controller.advance_list!.isEmpty
                ? const Text("No data found")
                : GridView.builder(
                
                    padding: const EdgeInsets.all(12),
                    itemCount: controller.advance_list!.length,
                    
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 6,
                        child: ListTile(
                            onTap: () {
                              s.getResponse(controller.advance_list![index].id);
                              
                              Get.toNamed("/singleAdvance",
                                  arguments:
                                      "${controller.advance_list![index].title}");
                            },
                            title: Center(
                                child: Text(
                                    "${controller.advance_list![index].title}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),))),
                      );
                    },
                  );
      }),
    );
    
  }
}

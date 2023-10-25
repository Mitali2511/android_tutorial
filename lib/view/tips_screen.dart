import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/tips_getx.dart';

class TipsScreen extends StatelessWidget {
  TipsScreen({super.key});

  final TipsGetxController tips = Get.put(TipsGetxController());

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 217, 234, 217),
      appBar: AppBar(
        title: const Text(
          "Tips",
        ),
        centerTitle: true,
      ),
     
      body: GetBuilder<TipsGetxController>(
        
        builder: (controller) {
        
        return tips.tips_list == null
            ? Center(child: CircularProgressIndicator())
           
            : ListView.builder(
                itemCount: controller.tips_list!.length,
                padding: EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    child: Container(
                
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color:  Color.fromARGB(255, 12, 52, 14),width: 1),
                      ),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width
                        /1.5,
                        child: Text("${controller.tips_list![index].tips}",
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                      ),
                    ),
                  );
                },
              );
      }),
    );
  }
}

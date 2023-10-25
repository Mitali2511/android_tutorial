import 'package:android___tutorial/getx/interview_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterviewScreen extends StatefulWidget {
  const InterviewScreen({super.key});

  @override
  State<InterviewScreen> createState() => _InterviewScreenState();
}

class _InterviewScreenState extends State<InterviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
   
        centerTitle: true,
        title: const Text("Interview question"),
      ),
      body: GetBuilder<InterviewGetxController>(builder: (controller) {
        return controller.interview_list == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.interview_list!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.onexpand(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 5, 63, 7),
                              width: 0.5),
                          borderRadius: BorderRadius.circular(0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                  foregroundColor: Colors.white,
                                  backgroundColor:
                                      Color.fromARGB(255, 18, 85, 21),
                                  child: Text("${index + 1}")),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width / 1.5,
                                child: Text(
                                  "${controller.interview_list![index].question}",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 18, 85, 21)),
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down_sharp)
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          controller.expand[index]
                              ? Text(
                                  "Answer:\n ${controller.interview_list![index].answer}",
                                  style: const TextStyle(fontSize: 14,fontWeight:  FontWeight.bold))
                              : const Offstage()
                        ],
                      ),
                    ),
                  );
                },
              );
      }),
    );
  }
}

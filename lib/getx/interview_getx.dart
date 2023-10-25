import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:android___tutorial/modal/interview_model.dart';
import 'package:get/get.dart';

class InterviewGetxController extends GetxController {
 

  List<InterviewModel>? interview_list;
  List expand = [].obs;

  getResponse() async {
    interview_list = null;

    try {
      var uri = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/android_tutorials/interview_questions_list"));

      if (uri.statusCode == 200) {
        var response = jsonDecode(uri.body);

        print("------------Interview List Response--------------------");
        print(response);

        interview_list =
            InterviewModel.getInterviewList(response).cast<InterviewModel>();

        expand = List.generate(interview_list!.length, (int index) => false);
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  onexpand(int index) {
    expand[index] = !expand[index];
    update();
  }
}

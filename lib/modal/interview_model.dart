
class InterviewModel {
    String? id;
    String? question;
    String? answer;

    InterviewModel({this.id, this.question, this.answer});

    InterviewModel.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        question = json["question"];
        answer = json["answer"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["question"] = question;
        _data["answer"] = answer;
        return _data;
    }
     static List getInterviewList(List result){
    return result.map((e) => InterviewModel.fromJson(e)).toList();
  }
}

class TutorialTipsModal {
    String? id;
    String? tips;

    TutorialTipsModal({this.id, this.tips});

    TutorialTipsModal.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        tips = json["tips"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["tips"] = tips;
        return _data;
    }
    static List getTutorialList(List result){
    return result.map((e) => TutorialTipsModal.fromJson(e)).toList();
  }
}
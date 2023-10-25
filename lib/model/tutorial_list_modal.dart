class TutorialListModal {
  String? id;
  String? title;

  TutorialListModal({this.id, this.title});

  TutorialListModal.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    return _data;
  }

  static List getTutorialList(List result){
    return result.map((e) => TutorialListModal.fromJson(e)).toList();
  }
}

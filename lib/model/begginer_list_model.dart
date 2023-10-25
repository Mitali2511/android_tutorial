
class BeginnerListModel {
    String? id;
    String? title;

    BeginnerListmodel({this.id, this.title});

    BeginnerListModal.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        title = json["title"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["title"] = title;
        return _data;
    }
    static List getBeginnerList(List result){
    return result.map((e) => BeginnerListModal.fromJson(e)).toList();
  }
}
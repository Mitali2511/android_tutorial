
class AdvanceListmodle {
    String? id;
    String? title;

    AdvanceListmodle({this.id, this.title});

    AdvanceListmodle.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        title = json["title"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["title"] = title;
        return _data;
    }
static List getAdvacneList(List result){
    return result.map((e) => AdvanceListmodle.fromJson(e)).toList();
  }

}
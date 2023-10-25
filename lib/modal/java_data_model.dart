
class JavaDataModel {
    String? fileName;
    String? code;

    JavaDataModel({this.fileName, this.code});

    JavaDataModel.fromJson(Map<String, dynamic> json) {
        fileName = json["file_name"];
        code = json["code"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["file_name"] = fileName;
        _data["code"] = code;
        return _data;
    }
    static List getJAvaData(List result){
    return result.map((e) => JavaDataModel.fromJson(e)).toList();
  }
}
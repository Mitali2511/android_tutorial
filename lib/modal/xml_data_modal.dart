
class XmlDataModel {
    String? fileName;
    String? code;

    XmlDataModel({this.fileName, this.code});

    XmlDataModel.fromJson(Map<String, dynamic> json) {
        fileName = json["file_name"];
        code = json["code"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["file_name"] = fileName;
        _data["code"] = code;
        return _data;
    }
    static List getXmlData(List result){
    return result.map((e) => XmlDataModel.fromJson(e)).toList();
  }

}
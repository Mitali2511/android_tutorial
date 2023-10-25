
class SingleBeginnerModal {
  String? id;
  String? title;
  String? java;
  String? xml;

  SingleBeginnerModal({
    this.id,
    this.title,
    this.java,
    this.xml,
  });

  SingleBeginnerModal.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    java = json["java"];
    xml = json["xml"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["java"] = java;
    _data["xml"] = xml;
    return _data;
  }

  static getsingleBeginnermap(Map result) {
    return SingleBeginnerModal(
        id: result["id"],
        java: result["java"],
        title: result["title"],
        xml: result["xml"]);
  }
}

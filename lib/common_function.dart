import 'dart:convert';
import 'package:http/http.dart' as http;

class CommonFuntion {
  static getResponse(
    String Link,
    Function onSuccess,
  ) async {
    try {
      var uri = await http.get(Uri.parse(Link));
      if (uri.statusCode == 200) {
        var response = jsonDecode(uri.body);
        onSuccess(response: response);
      }
    } catch (e) {
      print(e);
    }
  }
}

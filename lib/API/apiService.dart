import 'dart:convert';
import 'package:http/http.dart' as http;

_testUri() {
  final _uri = Uri.parse("http://127.0.0.1:8000/API/kullanicilar");
  return _uri;
}

class APIService<T> {
  final String url;
  final dynamic body;
  T Function(http.Response response) parse;
  APIService({this.url, this.body, this.parse});
}

class APIWeb {
  Future<T> load<T>(APIService<T> resource) async {
    final response = await http.get(_testUri() + resource.url);
    if (response.statusCode == 200)
      return resource.parse(response);
    else
      throw Exception(response.statusCode);
  }

  Future<T> post<T>(APIService<T> resource) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    final response = await http.post(_testUri() + resource.url,
        body: jsonEncode(resource.body), headers: headers);
    if (response.statusCode == 200)
      return resource.parse(response);
    else {
      throw Exception(response.statusCode);
    }
  }
}

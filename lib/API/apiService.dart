import 'package:aticode/API/models/teacherModel.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url =
      "https://mocki.io/v1/ce693f62-8d6c-48ea-b69a-086b5f5a36bc";

  Future<Teacher> fetchTeacherList() async {
    try {
      Response response = await _dio.get(_url);
      return Teacher.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception ocurred: $error stacktrace: $stacktrace");
      return Teacher.withError("Data not found / Connection issue");
    }
  }
}
/*
class APIService<T> {
  final Uri url;
  final dynamic body;
  T Function(http.Response response) parse;
  APIService({this.url, this.body, this.parse});
}

class APIWeb {
  Future<T> load<T>(APIService<T> resource) async {
    final response = await http.get(_testUri());
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
*/
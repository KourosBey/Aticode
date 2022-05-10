import 'dart:convert';
import 'dart:io';

import 'package:aticode/API/models/teacherModel.dart';
import 'package:aticode/API/models/userLoginModel.dart';
import 'package:aticode/API/respositories/userPostReq.dart';

import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = "http://10.0.2.2:8000";

  Future<List<Teacher>> fetchTeacherList() async {
    try {
      Response response = await _dio.get(_url + "/api/login/kullanicilar");
      return (response.data as List)
          .map((teacher) => Teacher.fromJson(teacher))
          .toList();
    } catch (error, stacktrace) {
      print("Exception ocurred: $error stacktrace: $stacktrace");
      throw Exception(error);
    }
  }

  Future<UserModelSendReq?> newUserPostRequest(UserModelSendReq user) async {
    try {
      Response response = await _dio.post(
        _url + "/api/register/",
        options: Options(
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
        ),
        data: user.toJson(),
      );
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<Token?> currentUserToken(CurrentUser currentUser) async {
    try {
      Response response = await _dio.post(_url + "/api/login/",
          options: Options(
            headers: {HttpHeaders.contentTypeHeader: "application/json"},
          ),
          data: json.encode(currentUser.toJson()));
      if (response.statusCode == 200) {
        return Token.fromJson(json.decode(response.data['token']));
      } else {
        print(json.decode(response.data['token']).toString());
      }
    } catch (error) {
      throw Exception(error);
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
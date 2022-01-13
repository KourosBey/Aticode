import 'package:aticode/API/models/teacherModel.dart';

import 'package:aticode/API/apiService.dart';

class TeacherRepository {
/* static APIService<List<Teacher>> load(url) {
    return APIService(
        url: url,
        parse: (response) {
          final parsed = json.decode(response.body);
          final dataJson = ResultModel.fromJSON(parsed);
          var teacherList = dataJson.responsedata as List;
          List<Teacher> teachers =
              teacherList.map((i) => Teacher.fromJson(i)).toList();

          return teachers;
        });
  }*/

  final _provider = ApiProvider();

  Future<Teacher> fetchTeacherList() {
    return _provider.fetchTeacherList();
  }
}

class NetworkError extends Error {}

import 'dart:async';
import 'dart:convert';

import 'package:aticode/API/models/postModel.dart';
import 'package:flutter/services.dart';

// ignore: deprecated_member_use

final String localJsonPath = 'assets/MOCK_DATA.json';
Future<List<PostModel>> loadLocalJson() async {
  var dummyData = await rootBundle.loadString(localJsonPath);
  List<PostModel> decodedJson = json.decode(dummyData);

  return decodedJson;
}

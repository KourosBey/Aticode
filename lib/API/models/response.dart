class ResultModel {
  final int responsecode;
  final String responsemessage;
  final dynamic responsedata;

  ResultModel({this.responsecode, this.responsedata, this.responsemessage});

//mapping Json data
  factory ResultModel.fromJSON(Map<String, dynamic> jsonMap) {
    var list = jsonMap["responseData"] as dynamic;
    final data = ResultModel(
        responsecode: jsonMap["responseCode"],
        responsemessage: jsonMap["responseMessage"],
        responsedata: list);

    return data;
  }
}

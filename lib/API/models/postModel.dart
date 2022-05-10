class PostModel {
  String? username;
  String? postMsg;
  DateTime? postReleaseTime;
  int? like;
  int? repost;
  int? comment;

  PostModel({
    this.username,
    this.comment,
    this.like,
    this.postMsg,
    this.postReleaseTime,
    this.repost,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      username: json["username"],
      postMsg: json["postMsg"],
      comment: json["comment"],
      like: json["like"],
      postReleaseTime: json["releaseTime"],
      repost: json["repost"],
    );
  }
}

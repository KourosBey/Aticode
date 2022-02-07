class UserModelSendReq {
  String? kEmail;
  String? username;
  String? kSifre2;

  String? kSifre;

  UserModelSendReq({
    this.kSifre = '',
    this.username = '',
    this.kEmail = '',
    this.kSifre2 = '',
  });

  Map<String, dynamic> toJson() => {
        "email": kEmail,
        "password": kSifre,
        "username": username,
        "password2": kSifre2
      };

  UserModelSendReq.copyWith(UserModelSendReq user) {
    kEmail = user.kEmail;
    username = user.username;
    kSifre = user.kSifre;
    kSifre2 = user.kSifre2;
  }
}

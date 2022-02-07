class CurrentUser {
  String? email;
  String? password;

  CurrentUser({this.email, this.password});

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

class Token {
  String? token;
  Token({this.token});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(token: json['token']);
  }
}

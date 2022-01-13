class UserModel {
  int? id;
  String? kTuru;
  String? kEmail;
  String? kAdi;
  String? kSoyadi;
  String? kSifre;
  String? kAvatar;
  List<int>? kIlgi;

  UserModel(
      {this.id,
      this.kAdi,
      this.kSoyadi,
      this.kSifre,
      this.kAvatar,
      this.kEmail,
      this.kIlgi,
      this.kTuru});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      kTuru: json["k_Turu"],
      kEmail: json["k_email"],
      kAdi: json["k_adi"],
      kSoyadi: json["k_soyadi"],
      kSifre: json["k_sifre"],
      kAvatar: json["k_avatar"],
      kIlgi: List<int>.from(json["k_ilgi"].map((x) => x)),
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "k_Turu": kTuru,
        "k_email": kEmail,
        "k_adi": kAdi,
        "k_soyadi": kSoyadi,
        "k_sifre": kSifre,
        "k_avatar": kAvatar,
        "k_ilgi": List<dynamic>.from(kIlgi!.map((x) => x)),
      };
}

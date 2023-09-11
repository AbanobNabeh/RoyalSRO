class ModelSignUP {
  String? email;
  String? name;
  String? silkroadId;
  String? webPassword;
  String? sroPassword;

  ModelSignUP(
      {this.email,
      this.name,
      this.silkroadId,
      this.webPassword,
      this.sroPassword});

  ModelSignUP.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    silkroadId = json['silkroad_id'];
    webPassword = json['web_password'];
    sroPassword = json['sro_password'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['silkroad_id'] = this.silkroadId;
    data['web_password'] = this.webPassword;
    data['sro_password'] = this.sroPassword;
    return data;
  }
}
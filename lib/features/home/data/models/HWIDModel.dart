class GetHwid {
  String? iD;
  String? active;
  String? token;
  String? hwid;
  String? ip;
  String? username;
  String? charname;

  GetHwid(
      {this.iD,
      this.active,
      this.token,
      this.hwid,
      this.ip,
      this.username,
      this.charname});

  GetHwid.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    active = json['active'];
    token = json['token'];
    hwid = json['hwid'];
    ip = json['ip'];
    username = json['username'];
    charname = json['charname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['active'] = this.active;
    data['token'] = this.token;
    data['hwid'] = this.hwid;
    data['ip'] = this.ip;
    data['username'] = this.username;
    data['charname'] = this.charname;
    return data;
  }
}

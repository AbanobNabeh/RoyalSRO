class BuyModel {
  String? iD;
  String? countDP;
  String? lE;
  String? fullname;
  String? phonenumber;
  String? screenshot;
  String? mobilewallet;
  String? playerName;
  String? state;
  String? gMread;
  String? date;

  BuyModel(
      {this.iD,
      this.countDP,
      this.lE,
      this.fullname,
      this.phonenumber,
      this.screenshot,
      this.mobilewallet,
      this.playerName,
      this.state,
      this.gMread,
      this.date});

  BuyModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    countDP = json['CountDP'];
    lE = json['LE'];
    fullname = json['Fullname'];
    phonenumber = json['phonenumber'];
    screenshot = json['screenshot'];
    mobilewallet = json['mobilewallet'];
    playerName = json['PlayerName'];
    state = json['state'];
    gMread = json['GMread'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CountDP'] = this.countDP;
    data['LE'] = this.lE;
    data['Fullname'] = this.fullname;
    data['phonenumber'] = this.phonenumber;
    data['screenshot'] = this.screenshot;
    data['mobilewallet'] = this.mobilewallet;
    data['PlayerName'] = this.playerName;
    data['state'] = this.state;
    data['GMread'] = this.gMread;
    data['Date'] = this.date;
    return data;
  }
}

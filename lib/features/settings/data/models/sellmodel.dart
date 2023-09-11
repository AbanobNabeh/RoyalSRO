class SellModel {
  String? iD;
  String? charName;
  String? phoneNumber;
  String? darkpoint;
  String? lE;
  String? state;
  String? date;
  String? gM;

  SellModel(
      {this.iD,
      this.charName,
      this.phoneNumber,
      this.darkpoint,
      this.lE,
      this.state,
      this.date,
      this.gM});

  SellModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    charName = json['CharName'];
    phoneNumber = json['PhoneNumber'];
    darkpoint = json['Darkpoint'];
    lE = json['LE'];
    state = json['State'];
    date = json['Date'];
    gM = json['GM'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CharName'] = this.charName;
    data['PhoneNumber'] = this.phoneNumber;
    data['Darkpoint'] = this.darkpoint;
    data['LE'] = this.lE;
    data['State'] = this.state;
    data['Date'] = this.date;
    data['GM'] = this.gM;
    return data;
  }
}

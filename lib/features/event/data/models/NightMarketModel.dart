class NightMarketModel {
  String? iD;
  String? charname;
  String? charID;
  String? silk;
  String? price;
  String? charIMG;
  String? date;

  NightMarketModel(
      {this.iD,
      this.charname,
      this.charID,
      this.silk,
      this.price,
      this.charIMG,
      this.date});

  NightMarketModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    charname = json['Charname'];
    charID = json['CharID'];
    silk = json['Silk'];
    price = json['Price'];
    charIMG = json['CharIMG'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Charname'] = this.charname;
    data['CharID'] = this.charID;
    data['Silk'] = this.silk;
    data['Price'] = this.price;
    data['CharIMG'] = this.charIMG;
    data['Date'] = this.date;
    return data;
  }
}

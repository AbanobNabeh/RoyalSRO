class GiftModel {
  String? iD;
  String? hWID;
  String? iP;
  String? charName;
  String? silk;

  GiftModel({this.iD, this.hWID, this.iP, this.charName, this.silk});

  GiftModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    hWID = json['HWID'];
    iP = json['IP'];
    charName = json['CharName'];
    silk = json['silk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['HWID'] = this.hWID;
    data['IP'] = this.iP;
    data['CharName'] = this.charName;
    data['silk'] = this.silk;
    return data;
  }
}

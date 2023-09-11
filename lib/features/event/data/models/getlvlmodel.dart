class Getlvl {
  String? charID;
  String? lVL;

  Getlvl({this.charID, this.lVL});

  Getlvl.fromJson(Map<String, dynamic> json) {
    charID = json['CharID'];
    lVL = json['LVL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CharID'] = this.charID;
    data['LVL'] = this.lVL;
    return data;
  }
}

class DailyRWModel {
  String? iD;
  String? day;
  String? refItemID;
  String? rwname;
  String? count;
  String? image;

  DailyRWModel(
      {this.iD, this.day, this.refItemID, this.rwname, this.count, this.image});

  DailyRWModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    day = json['Day'];
    refItemID = json['RefItemID'];
    rwname = json['Rwname'];
    count = json['Count'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Day'] = this.day;
    data['RefItemID'] = this.refItemID;
    data['Rwname'] = this.rwname;
    data['Count'] = this.count;
    data['Image'] = this.image;
    return data;
  }
}

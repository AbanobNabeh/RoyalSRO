class VIPModel {
  String? iD;
  String? charID;
  String? iP;
  String? date;
  String? point;
  String? quest;
  String? dateCollect;

  VIPModel({
    this.iD,
    this.charID,
    this.iP,
    this.date,
    this.point,
    this.quest,
    this.dateCollect,
  });

  VIPModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    charID = json['CharID'];
    iP = json['IP'];
    date = json['Date'];
    point = json['Point'];
    quest = json['Quest'];
    dateCollect = json['DateCollect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CharID'] = this.charID;
    data['IP'] = this.iP;
    data['Date'] = this.date;
    data['Point'] = this.point;
    data['Quest'] = this.quest;
    data['DateCollect'] = this.dateCollect;
    return data;
  }
}

class ModelChest {
  String? charID;
  String? ItemID;
  String? count;

  ModelChest({this.charID, this.ItemID, this.count});

  ModelChest.fromJson(Map<String, dynamic> json) {
    charID = json['CharID'];
    ItemID = json['ItemID'];
    count = json['Count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CharID'] = this.charID;
    data['ItemID'] = this.ItemID;
    data['Count'] = this.count;
    return data;
  }
}

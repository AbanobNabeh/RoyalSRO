class GlobalModel {
  String? iD;
  String? charName;
  String? globalChat;
  String? date;
  String? color;

  GlobalModel({this.iD, this.charName, this.globalChat, this.date, this.color});

  GlobalModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    charName = json['CharName'];
    globalChat = json['GlobalChat'];
    date = json['Date'];
    color = json['Color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CharName'] = this.charName;
    data['GlobalChat'] = this.globalChat;
    data['Date'] = this.date;
    data['Color'] = this.color;
    return data;
  }
}

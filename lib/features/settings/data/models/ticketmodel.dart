class ModelTicket {
  String? iD;
  String? title;
  String? category;
  String? subject;
  String? charname;
  String? state;
  String? supread;
  String? playerread;
  GetWebimage? getWebimage;

  ModelTicket(
      {this.iD,
      this.title,
      this.category,
      this.subject,
      this.charname,
      this.state,
      this.supread,
      this.playerread,
      this.getWebimage});

  ModelTicket.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    title = json['title'];
    category = json['category'];
    subject = json['subject'];
    charname = json['Charname'];
    state = json['state'];
    supread = json['Supread'];
    playerread = json['Playerread'];
    getWebimage = json['get_webimage'] != null
        ? new GetWebimage.fromJson(json['get_webimage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['title'] = this.title;
    data['category'] = this.category;
    data['subject'] = this.subject;
    data['Charname'] = this.charname;
    data['state'] = this.state;
    data['Supread'] = this.supread;
    data['Playerread'] = this.playerread;
    if (this.getWebimage != null) {
      data['get_webimage'] = this.getWebimage!.toJson();
    }
    return data;
  }
}

class GetWebimage {
  String? iD;
  String? iMG1;
  String? iMG2;
  String? iMG3;
  String? iMG4;
  String? iMG5;
  String? iMG6;
  String? iMG7;
  String? iMG8;
  String? iMG9;
  String? iMG10;
  String? iMG11;
  String? iMG12;
  String? iMG0;

  GetWebimage(
      {this.iD,
      this.iMG1,
      this.iMG2,
      this.iMG3,
      this.iMG4,
      this.iMG5,
      this.iMG6,
      this.iMG7,
      this.iMG8,
      this.iMG9,
      this.iMG10,
      this.iMG11,
      this.iMG12,
      this.iMG0});

  GetWebimage.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    iMG1 = json['IMG1'];
    iMG2 = json['IMG2'];
    iMG3 = json['IMG3'];
    iMG4 = json['IMG4'];
    iMG5 = json['IMG5'];
    iMG6 = json['IMG6'];
    iMG7 = json['IMG7'];
    iMG8 = json['IMG8'];
    iMG9 = json['IMG9'];
    iMG10 = json['IMG10'];
    iMG11 = json['IMG11'];
    iMG12 = json['IMG12'];
    iMG0 = json['IMG0'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['IMG1'] = this.iMG1;
    data['IMG2'] = this.iMG2;
    data['IMG3'] = this.iMG3;
    data['IMG4'] = this.iMG4;
    data['IMG5'] = this.iMG5;
    data['IMG6'] = this.iMG6;
    data['IMG7'] = this.iMG7;
    data['IMG8'] = this.iMG8;
    data['IMG9'] = this.iMG9;
    data['IMG10'] = this.iMG10;
    data['IMG11'] = this.iMG11;
    data['IMG12'] = this.iMG12;
    data['IMG0'] = this.iMG0;
    return data;
  }
}

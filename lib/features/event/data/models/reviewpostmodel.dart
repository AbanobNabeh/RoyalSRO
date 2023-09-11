class GetViewposts {
  String? iD;
  String? review;
  String? iDPost;
  String? charID;
  String? charName;
  String? dateTime;
  String? comment;
  String? charIMG;

  GetViewposts(
      {this.iD,
      this.review,
      this.iDPost,
      this.charID,
      this.charName,
      this.dateTime,
      this.comment,
      this.charIMG});

  GetViewposts.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    review = json['Review'];
    iDPost = json['IDPost'];
    charID = json['CharID'];
    charName = json['CharName'];
    dateTime = json['DateTime'];
    comment = json['Comment'];
    charIMG = json['CharIMG'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Review'] = this.review;
    data['IDPost'] = this.iDPost;
    data['CharID'] = this.charID;
    data['CharName'] = this.charName;
    data['DateTime'] = this.dateTime;
    data['Comment'] = this.comment;
    data['CharIMG'] = this.charIMG;
    return data;
  }
}

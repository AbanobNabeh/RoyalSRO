class MessageModel {
  String? namesender;
  String? date;
  String? rec;
  String? img;
  String? message;
  String? namereceive;

  MessageModel(
      {this.namesender,
      this.date,
      this.rec,
      this.img,
      this.message,
      this.namereceive});

  MessageModel.fromJson(Map<String, dynamic> json) {
    namesender = json['namesender'];
    date = json['date'];
    rec = json['rec'];
    img = json['img'];
    message = json['message'];
    namereceive = json['namereceive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['namesender'] = this.namesender;
    data['date'] = this.date;
    data['rec'] = this.rec;
    data['img'] = this.img;
    data['message'] = this.message;
    data['namereceive'] = this.namereceive;
    return data;
  }
}

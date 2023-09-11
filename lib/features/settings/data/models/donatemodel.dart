class DonateModel {
  String? iD;
  String? name;
  String? price;

  DonateModel({this.iD, this.name, this.price});

  DonateModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    price = json['Price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    data['Price'] = this.price;
    return data;
  }
}

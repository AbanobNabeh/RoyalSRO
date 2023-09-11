class DonatePaymentModel {
  String? iD;
  String? name;
  String? phonenumber;
  String? image;
  String? charName;
  String? wallet;
  String? gM;
  String? date;
  String? state;
  String? price;

  DonatePaymentModel(
      {this.iD,
      this.name,
      this.phonenumber,
      this.image,
      this.charName,
      this.gM,
      this.date,
      this.state,
      this.wallet,
      this.price});

  DonatePaymentModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    phonenumber = json['Phonenumber'];
    image = json['Image'];
    charName = json['CharName'];
    gM = json['GM'];
    date = json['Date'];
    state = json['State'];
    price = json['price'];
    wallet = json['Wallet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    data['Phonenumber'] = this.phonenumber;
    data['Image'] = this.image;
    data['CharName'] = this.charName;
    data['GM'] = this.gM;
    data['Date'] = this.date;
    data['State'] = this.state;
    data['price'] = this.price;
    data['Wallet'] = this.wallet;
    return data;
  }
}

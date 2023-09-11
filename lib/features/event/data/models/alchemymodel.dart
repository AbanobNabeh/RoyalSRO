class AlchemyModel {
  var amount;
  var slot;
  var serial64;
  var typeID2;
  var optLevel;
  var refItemID;
  var special;
  var itemID;
  var itemName;
  var imgpath;
  WebInventory? webInventory;
  var data;

  AlchemyModel(
      {this.amount,
      this.slot,
      this.serial64,
      this.typeID2,
      this.optLevel,
      this.refItemID,
      this.special,
      this.itemID,
      this.itemName,
      this.imgpath,
      this.webInventory,
      this.data});

  AlchemyModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    slot = json['Slot'];
    serial64 = json['Serial64'];
    typeID2 = json['TypeID2'];
    optLevel = json['OptLevel'];
    refItemID = json['RefItemID'];
    special = json['special'];
    itemID = json['ItemID'];
    itemName = json['ItemName'];
    imgpath = json['imgpath'];
    webInventory = json['WebInventory'] != null
        ? new WebInventory.fromJson(json['WebInventory'])
        : null;
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['Slot'] = this.slot;
    data['Serial64'] = this.serial64;
    data['TypeID2'] = this.typeID2;
    data['OptLevel'] = this.optLevel;
    data['RefItemID'] = this.refItemID;
    data['special'] = this.special;
    data['ItemID'] = this.itemID;
    data['ItemName'] = this.itemName;
    data['imgpath'] = this.imgpath;
    if (this.webInventory != null) {
      data['WebInventory'] = this.webInventory!.toJson();
    }
    data['data'] = this.data;
    return data;
  }
}

class WebInventory {
  var reqLevel1;
  var canSell;
  var canTrade;
  var canBuy;
  var typeID2;
  var typeID3;
  var typeID4;
  var price;
  var sox;
  var optLevel;
  var degree;
  var webName;
  var race;
  var type;

  WebInventory(
      {this.reqLevel1,
      this.canSell,
      this.canTrade,
      this.canBuy,
      this.typeID2,
      this.typeID3,
      this.typeID4,
      this.price,
      this.sox,
      this.optLevel,
      this.degree,
      this.webName,
      this.race,
      this.type});

  WebInventory.fromJson(Map<String, dynamic> json) {
    reqLevel1 = json['ReqLevel1'];
    canSell = json['CanSell'];
    canTrade = json['CanTrade'];
    canBuy = json['CanBuy'];
    typeID2 = json['TypeID2'];
    typeID3 = json['TypeID3'];
    typeID4 = json['TypeID4'];
    price = json['Price'];
    sox = json['sox'];
    optLevel = json['OptLevel'];
    degree = json['Degree'];
    webName = json['WebName'];
    race = json['Race'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ReqLevel1'] = this.reqLevel1;
    data['CanSell'] = this.canSell;
    data['CanTrade'] = this.canTrade;
    data['CanBuy'] = this.canBuy;
    data['TypeID2'] = this.typeID2;
    data['TypeID3'] = this.typeID3;
    data['TypeID4'] = this.typeID4;
    data['Price'] = this.price;
    data['sox'] = this.sox;
    data['OptLevel'] = this.optLevel;
    data['Degree'] = this.degree;
    data['WebName'] = this.webName;
    data['Race'] = this.race;
    data['Type'] = this.type;
    return data;
  }
}

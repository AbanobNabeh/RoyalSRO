class EventSchedule {
  String? ID;
  String? Eventname;
  String? day;
  String? time;

  EventSchedule({this.Eventname, this.day, this.time});

  EventSchedule.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    Eventname = json['Eventname'];
    day = json['Day'];
    time = json['Time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.ID;
    data['Eventname'] = this.Eventname;
    data['Day'] = this.day;
    data['Time'] = this.time;
    return data;
  }
}

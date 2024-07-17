class Customer_model {
  String? name;
  String? phonenumber;
  String? address;
  String? city;
  String? state;
  String? startdate;
  String? dailyQuantity;
  String? Customerstype;
  String? category;
  String? SelectCattle;
  String? BusinesName;
  String? uid;
  String? DeliverySchedule;
  Customer_model({
    this.name,
    this.phonenumber,
    this.address,
    this.city,
    this.state,
    this.startdate,
    this.Customerstype,
    this.category,
    this.dailyQuantity,
    this.SelectCattle,
    this.BusinesName,
    this.DeliverySchedule,
    this.uid,
  });

  Map<String, dynamic> tojson() {
    return {
      "name": name,
      "phonenumber": phonenumber,
      "address": address,
      "city": city,
      "state": state,
      "startdate": startdate,
      "Customerstype": Customerstype,
      "category": category,
      "dailyQuantity": dailyQuantity,
      "SelectCattle": SelectCattle,
      "DeliverySchedule": DeliverySchedule,
      "BusinesName": BusinesName,
      "uid": uid,
    };
  }

  Customer_model.form_basic_custamer_model(Map<String, dynamic> json, this.uid)
      : name = json['name'] ?? "",
        phonenumber = json['phonenumber'] ?? "",
        address = json['address'] ?? "",
        city = json['city'] ?? "",
        state = json['state'] ?? "",
        startdate = json['startdate'] ?? "",
        Customerstype = json['Customerstype'] ?? "",
        category = json['category'] ?? "",
        dailyQuantity = json['dailyQuantity'] ?? "",
        SelectCattle = json['SelectCattle'] ?? "",
        DeliverySchedule = json['DeliverySchedule'] ?? "",
        BusinesName = json["BusinessName"] ?? "";
}

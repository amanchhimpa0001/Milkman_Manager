class MilkModel {
  String? fat;
  String? Quantity;
  String? Rate;
  String? Milktype;
  String? Collectform;
  String? address;
  String? status;
  String? createdate;
  String? uid;

  MilkModel(
      {this.fat,
      this.Rate,
      this.Quantity,
      this.Milktype,
      this.Collectform,
      this.address,
      this.status,
      this.createdate,
      this.uid});

  Map<String, dynamic> tojson() {
    return {
      "fat": fat,
      "Rate": Rate,
      "Quantity": Quantity,
      "Milktype": Milktype,
      "Collectform": Collectform,
      "address": address,
      "status": status,
      "createdate": createdate,
      "uid": uid,
    };
  }

  MilkModel.from_basic_Milkmodel(Map<String, dynamic> json)
      : fat = json["fat"] ?? "",
        Rate = json["Rate"] ?? "",
        uid = json["uid"] ?? "",
        Quantity = json["Quantity"] ?? "",
        Milktype = json["Milktype"] ?? "",
        Collectform = json["Collectform"] ?? "",
        address = json["address"] ?? "",
        status = json["status"] ?? "",
        createdate = json['createdate'] ?? "";
}

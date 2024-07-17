class Delivery_model {
  String name, shortname, ltr, address, fat, btnname;
  Delivery_model(this.name, this.shortname, this.address, this.ltr, this.fat,
      this.btnname);
}

class Delivery_model_helper {
  static var todaydeliverlist = [
    Delivery_model("Will Smith", "WS", "12, Talaki Gate, Near\nBus Stand,Hisar",
        "3Ltr", " @ 60% Fat", "Deliver"),
    Delivery_model("Johnson", "J ", "12, Talaki Gate, Near\nBus Stand,Hisar",
        "4Ltr", " @ 40% Fat", "Deliver"),
    Delivery_model(
        "Robart Kett",
        "RK",
        "12, Talaki Gate, Near\nBus Stand,Hisar",
        "6Ltr",
        " @ 50% Fat",
        "Deliver"),
  ];
  static var PendingCollectionslist = [
    Delivery_model("Will Smith", "WS", "12, Talaki Gate, Near\nBus Stand,Hisar",
        "3Ltr", " @ 60% Fat", "Collect"),
    Delivery_model("Johnson", "J ", "12, Talaki Gate, Near\nBus Stand,Hisar",
        "4Ltr", " @ 40% Fat", "Collect"),
    Delivery_model(
        "Robart Kett",
        "RK",
        "12, Talaki Gate, Near\nBus Stand,Hisar",
        "6Ltr",
        " @ 50% Fat",
        "Collect"),
  ];
}

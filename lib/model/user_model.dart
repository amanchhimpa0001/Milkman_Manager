class user_model {
  String? fullname;
  String? phone_number;
  String? email;
  String? gender;
  String? business_name;
  String? business_address;
  String? state;
  String? city;
  String? uid;
  String? image;

  user_model(
      {this.business_address,
      this.business_name,
      this.city,
      this.gender,
      this.email,
      this.phone_number,
      this.state,
      this.fullname,
      this.uid,
      this.image});
  user_model copyWith({
    String? fullname,
    phone_number,
    email,
    gender,
    business_name,
    business_address,
    state,
    city,
    uid,
    image,
  }) {
    return user_model(
        business_address: business_address ?? this.business_address,
        business_name: business_name ?? this.business_name,
        city: city ?? this.city,
        gender: gender ?? this.gender,
        email: email ?? this.email,
        phone_number: phone_number ?? this.phone_number,
        state: state ?? this.state,
        fullname: fullname ?? this.fullname,
        uid: uid ?? this.uid,
        image: image ?? this.image);
  }

  Map<String, dynamic> tojson() {
    return {
      "business_address": business_address,
      "business_name": business_name,
      "city": city,
      "gender": gender,
      "email": email,
      "phone_number": phone_number,
      "state": state,
      "fullname": fullname,
      "uid": uid,
      'image': image
    };
  }

  user_model.fromuser_basic_model(Map<String, dynamic> json, this.uid)
      : business_address = json["business_address"] ?? "",
        business_name = json["business_name"] ?? "",
        city = json["city"] ?? "",
        gender = json["gender"] ?? "",
        email = json["email"] ?? "",
        phone_number = json["phone_number"] ?? "",
        state = json["state"] ?? "",
        fullname = json["fullname"] ?? "",
        image = json['image'] ?? '';
}

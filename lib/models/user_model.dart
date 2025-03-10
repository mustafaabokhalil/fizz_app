class UserModel {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? image;
  String? carLicenseImage;
  int? available;
  String? wallet;
  String? carNumber;
  String? carModel;
  String? carType;
  int? isMale;
  String? birthDay;
  String? iDNumber;
  String? nationality;
  String? fcm;

  UserModel(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.image,
      this.carLicenseImage,
      this.available,
      this.wallet,
      this.carNumber,
      this.nationality,
      this.carModel,
      this.carType,
      this.isMale,
      this.birthDay,
      this.iDNumber,
      this.fcm});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    carLicenseImage = json['car_license_image'];
    nationality = json['nationality'];
    available = json['available'];
    wallet = json['wallet'];
    carNumber = json['car_number'];
    carModel = json['car_model'];
    carType = json['car_type'];
    isMale = json['is_male'];
    birthDay = json['birth_day'];
    iDNumber = json['ID_number'];
    fcm = json['fcm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['image'] = this.image;
    data['car_license_image'] = this.carLicenseImage;
    data['available'] = this.available;
    data['wallet'] = this.wallet;
    data['car_number'] = this.carNumber;
    data['car_model'] = this.carModel;
    data['car_type'] = this.carType;
    data['is_male'] = this.isMale;
    data['birth_day'] = this.birthDay;
    data['ID_number'] = this.iDNumber;
    data['fcm'] = this.fcm;
    return data;
  }
}

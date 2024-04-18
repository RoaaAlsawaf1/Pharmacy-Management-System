class PharmacyMedicineHome {
  List<Pharmacies>? pharmacies;

  PharmacyMedicineHome({this.pharmacies});

  PharmacyMedicineHome.fromJson(Map<String, dynamic> json) {
    if (json['pharmacies'] != null) {
      pharmacies = <Pharmacies>[];
      json['pharmacies'].forEach((v) {
        pharmacies!.add(new Pharmacies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pharmacies != null) {
      data['pharmacies'] = this.pharmacies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pharmacies {
  int? id;
  int? userId;
  String? pharmacyName;
  String? number;
  String? pathOfPhoto;
  String? longitude;
  String? latitude;
  String? ownerOfPermissionName;
  int? validated;
  int? locationId;
  int? holidayId;
  int? fromMin;
  int? toMin;
  String? createdAt;
  String? updatedAt;
  Holiday? holiday;
  User? user;

  Pharmacies(
      {this.id,
        this.userId,
        this.pharmacyName,
        this.number,
        this.pathOfPhoto,
        this.longitude,
        this.latitude,
        this.ownerOfPermissionName,
        this.validated,
        this.locationId,
        this.holidayId,
        this.fromMin,
        this.toMin,
        this.createdAt,
        this.updatedAt,
        this.holiday,
        this.user});

  Pharmacies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    pharmacyName = json['pharmacyName'];
    number = json['number'];
    pathOfPhoto = json['path_of_photo'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    ownerOfPermissionName = json['owner_of_permission_name'];
    validated = json['validated'];
    locationId = json['location_id'];
    holidayId = json['holiday_id'];
    fromMin = json['from_min'];
    toMin = json['to_min'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    holiday =
    json['holiday'] != null ? new Holiday.fromJson(json['holiday']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['pharmacyName'] = this.pharmacyName;
    data['number'] = this.number;
    data['path_of_photo'] = this.pathOfPhoto;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['owner_of_permission_name'] = this.ownerOfPermissionName;
    data['validated'] = this.validated;
    data['location_id'] = this.locationId;
    data['holiday_id'] = this.holidayId;
    data['from_min'] = this.fromMin;
    data['to_min'] = this.toMin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.holiday != null) {
      data['holiday'] = this.holiday!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Holiday {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Holiday({this.id, this.name, this.createdAt, this.updatedAt});

  Holiday.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? name;
  Null? phoneNumber;
  Null? gender;
  String? email;
  Null? age;
  Null? emailVerifiedAt;
  Null? locationId;
  int? adminLevel;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.name,
        this.phoneNumber,
        this.gender,
        this.email,
        this.age,
        this.emailVerifiedAt,
        this.locationId,
        this.adminLevel,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
    email = json['email'];
    age = json['age'];
    emailVerifiedAt = json['email_verified_at'];
    locationId = json['location_id'];
    adminLevel = json['admin_level'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['age'] = this.age;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['location_id'] = this.locationId;
    data['admin_level'] = this.adminLevel;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
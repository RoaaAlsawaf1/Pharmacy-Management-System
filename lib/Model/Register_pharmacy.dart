class ModelPharmacy {
  int? id;
  String? name;
  String? phoneNumber;
  String? gender;
  String? email;
  int? age;
  String? emailVerifiedAt;
  int? locationId;
  int? adminLevel;
  String? createdAt;
  String? updatedAt;
  List<Pharmacies>? pharmacies;
  List<Warehouses>? warehouses;



  ModelPharmacy.fromJson(Map<String, dynamic> json) {
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
    if (json['pharmacies'] != null) {
      pharmacies = <Pharmacies>[];
      json['pharmacies'].forEach((v) {
        pharmacies!.add(new Pharmacies.fromJson(v));
      });
    }
    if (json['warehouses'] != null) {
      warehouses = <Warehouses>[];
      json['warehouses'].forEach((v) {
        warehouses!.add(new Warehouses.fromJson(v));
      });
    }
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
  String? createdAt;
  String? updatedAt;



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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}

class Warehouses {
  int? id;
  int? userId;
  String? warehouseName;
  String? number;
  String? ownerOfPermissionName;
  int? validated;
  int? locationId;
  String? createdAt;
  String? updatedAt;
  String? pathOfPhoto;



  Warehouses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    pathOfPhoto = json['path_of_photo'];
    warehouseName = json['warehouseName'];
    number = json['number'];
    ownerOfPermissionName = json['owner_of_permission_name'];
    validated = json['validated'];
    locationId = json['location_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}
class DashBordPharmacy {
  List<Pharmacies>? pharmacies;



  DashBordPharmacy.fromJson(Map<String, dynamic> json) {
    if (json['pharmacies'] != null) {
      pharmacies = <Pharmacies>[];
      json['pharmacies'].forEach((v) {
        pharmacies!.add( Pharmacies.fromJson(v));
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
  Location? location;



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
    location = json['location'] != null
        ?  Location.fromJson(json['location'])
        : null;
  }


}

class Location {
  int? id;
  String? locationDesc;
  int? areaId;
  String? createdAt;
  String? updatedAt;
  Area? area;



  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locationDesc = json['location_desc'];
    areaId = json['area_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    area = json['area'] != null ?  Area.fromJson(json['area']) : null;
  }


}

class Area {
  int? id;
  String? nameAr;
  String? nameEn;
  int? cityId;
  String? createdAt;
  String? updatedAt;
  City? city;



  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    city = json['city'] != null ?  City.fromJson(json['city']) : null;
  }


}

class City {
  int? id;
  String? nameAr;
  String? nameEn;
  String? createdAt;
  String? updatedAt;



  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}
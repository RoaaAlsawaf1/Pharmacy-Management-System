class DashBordWarehouse {
  List<Warehouses>? warehouses;



  DashBordWarehouse.fromJson(Map<String, dynamic> json) {
    if (json['warehouses'] != null) {
      warehouses = <Warehouses>[];
      json['warehouses'].forEach((v) {
        warehouses!.add(new Warehouses.fromJson(v));
      });
    }
  }


}

class Warehouses {
  int? id;
  int? userId;
  String? warehouseName;
  String? number;
  String? pathOfPhoto;
  String? ownerOfPermissionName;
  int? validated;
  int? locationId;
  String? createdAt;
  String? updatedAt;
  Location? location;

  Warehouses(
      {this.id,
        this.userId,
        this.warehouseName,
        this.number,
        this.pathOfPhoto,
        this.ownerOfPermissionName,
        this.validated,
        this.locationId,
        this.createdAt,
        this.updatedAt,
        this.location});

  Warehouses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    warehouseName = json['warehouseName'];
    number = json['number'];
    pathOfPhoto = json['path_of_photo'];
    ownerOfPermissionName = json['owner_of_permission_name'];
    validated = json['validated'];
    locationId = json['location_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
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
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
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
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
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
class OrderWarehouseWork {
  List<WarehouseOrders>? warehouseOrders;


  OrderWarehouseWork.fromJson(Map<String, dynamic> json) {
    if (json['warehouseOrders'] != null) {
      warehouseOrders = <WarehouseOrders>[];
      json['warehouseOrders'].forEach((v) {
        warehouseOrders!.add(new WarehouseOrders.fromJson(v));
      });
    }
  }


}

class WarehouseOrders {
  int? id;
  String? date;
  int? state;
  int? warehouseId;
  int? pharmacyId;
  String? createdAt;
  String? updatedAt;
  Pharmacy? pharmacy;



  WarehouseOrders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    state = json['state'];
    warehouseId = json['warehouse_id'];
    pharmacyId = json['pharmacy_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pharmacy = json['pharmacy'] != null
        ? new Pharmacy.fromJson(json['pharmacy'])
        : null;
  }


}

class Pharmacy {
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



  Pharmacy.fromJson(Map<String, dynamic> json) {
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
  }


}

class Holiday {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;



  Holiday.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}

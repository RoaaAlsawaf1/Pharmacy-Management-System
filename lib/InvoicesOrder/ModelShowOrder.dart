class invoicesModel {
  List<Dispenserinvoices>? dispenserinvoices;

  invoicesModel({this.dispenserinvoices});

  invoicesModel.fromJson(Map<String, dynamic> json) {
    if (json['Dispenserinvoices'] != null) {
      dispenserinvoices = <Dispenserinvoices>[];
      json['Dispenserinvoices'].forEach((v) {
        dispenserinvoices!.add(new Dispenserinvoices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dispenserinvoices != null) {
      data['Dispenserinvoices'] =
          this.dispenserinvoices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dispenserinvoices {
  int? id;
  int? totalPrice;
  String? dateOfInvoice;
  int? state;
  int? warehouseDispenserId;
  int? orderId;
  String? createdAt;
  String? updatedAt;
  BuyOrder? buyOrder;

  Dispenserinvoices(
      {this.id,
        this.totalPrice,
        this.dateOfInvoice,
        this.state,
        this.warehouseDispenserId,
        this.orderId,
        this.createdAt,
        this.updatedAt,
        this.buyOrder});

  Dispenserinvoices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalPrice = json['total_price'];
    dateOfInvoice = json['date_of_invoice'];
    state = json['state'];
    warehouseDispenserId = json['warehouseDispenser_id'];
    orderId = json['order_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    buyOrder = json['buy_order'] != null
        ? new BuyOrder.fromJson(json['buy_order'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total_price'] = this.totalPrice;
    data['date_of_invoice'] = this.dateOfInvoice;
    data['state'] = this.state;
    data['warehouseDispenser_id'] = this.warehouseDispenserId;
    data['order_id'] = this.orderId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.buyOrder != null) {
      data['buy_order'] = this.buyOrder!.toJson();
    }
    return data;
  }
}

class BuyOrder {
  int? id;
  String? date;
  int? state;
  int? warehouseId;
  int? pharmacyId;
  String? createdAt;
  String? updatedAt;
  Pharmacy? pharmacy;

  BuyOrder(
      {this.id,
        this.date,
        this.state,
        this.warehouseId,
        this.pharmacyId,
        this.createdAt,
        this.updatedAt,
        this.pharmacy});

  BuyOrder.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['state'] = this.state;
    data['warehouse_id'] = this.warehouseId;
    data['pharmacy_id'] = this.pharmacyId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pharmacy != null) {
      data['pharmacy'] = this.pharmacy!.toJson();
    }
    return data;
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

  Pharmacy(
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
        this.holiday});

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
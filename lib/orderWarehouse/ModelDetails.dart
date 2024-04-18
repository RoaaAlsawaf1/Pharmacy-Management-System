class Details {
  List<OrderDetails>? orderDetails;

  Details({this.orderDetails});

  Details.fromJson(Map<String, dynamic> json) {
    if (json['orderDetails'] != null) {
      orderDetails = <OrderDetails>[];
      json['orderDetails'].forEach((v) {
        orderDetails!.add(new OrderDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderDetails != null) {
      data['orderDetails'] = this.orderDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderDetails {
  int? id;
  int? quantity;
  int? receivedAmounts;
  int? orderId;
  int? warehouseMedicineId;
  int? offerId;
  int? loadId;
  String? createdAt;
  String? updatedAt;
  WarehouseMedicine? warehouseMedicine;
  Offer? offer;
  LoadQuantity? loadQuantity;

  OrderDetails(
      {this.id,
        this.quantity,
        this.receivedAmounts,
        this.orderId,
        this.warehouseMedicineId,
        this.offerId,
        this.loadId,
        this.createdAt,
        this.updatedAt,
        this.warehouseMedicine,
        this.offer,
        this.loadQuantity});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    receivedAmounts = json['received_amounts'];
    orderId = json['order_id'];
    warehouseMedicineId = json['warehouseMedicine_id'];
    offerId = json['offer_id'];
    loadId = json['load_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    warehouseMedicine = json['warehouse_medicine'] != null
        ? new WarehouseMedicine.fromJson(json['warehouse_medicine'])
        : null;
    offer = json['offer'] != null ? new Offer.fromJson(json['offer']) : null;
    loadQuantity = json['load_quantity'] != null
        ? new LoadQuantity.fromJson(json['load_quantity'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['received_amounts'] = this.receivedAmounts;
    data['order_id'] = this.orderId;
    data['warehouseMedicine_id'] = this.warehouseMedicineId;
    data['offer_id'] = this.offerId;
    data['load_id'] = this.loadId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.warehouseMedicine != null) {
      data['warehouse_medicine'] = this.warehouseMedicine!.toJson();
    }
    if (this.offer != null) {
      data['offer'] = this.offer!.toJson();
    }
    if (this.loadQuantity != null) {
      data['load_quantity'] = this.loadQuantity!.toJson();
    }
    return data;
  }
}

class WarehouseMedicine {
  int? id;
  int? maxQuantity;
  int? warehouseId;
  int? medicineId;
  String? createdAt;
  String? updatedAt;
  Medicine? medicine;

  WarehouseMedicine(
      {this.id,
        this.maxQuantity,
        this.warehouseId,
        this.medicineId,
        this.createdAt,
        this.updatedAt,
        this.medicine});

  WarehouseMedicine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maxQuantity = json['max_quantity'];
    warehouseId = json['warehouse_id'];
    medicineId = json['medicine_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    medicine = json['medicine'] != null
        ? new Medicine.fromJson(json['medicine'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['max_quantity'] = this.maxQuantity;
    data['warehouse_id'] = this.warehouseId;
    data['medicine_id'] = this.medicineId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.medicine != null) {
      data['medicine'] = this.medicine!.toJson();
    }
    return data;
  }
}

class Medicine {
  int? id;
  String? tradeNameAr;
  String? tradeNameEn;
  String? descriptionEn;
  String? descriptionAr;
  int? commercialPrice;
  int? netPrice;
  int? companyId;
  String? createdAt;
  String? updatedAt;
  Company? company;

  Medicine(
      {this.id,
        this.tradeNameAr,
        this.tradeNameEn,
        this.descriptionEn,
        this.descriptionAr,
        this.commercialPrice,
        this.netPrice,
        this.companyId,
        this.createdAt,
        this.updatedAt,
        this.company});

  Medicine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tradeNameAr = json['trade_name_ar'];
    tradeNameEn = json['trade_name_en'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    commercialPrice = json['commercial_price'];
    netPrice = json['net_price'];
    companyId = json['company_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trade_name_ar'] = this.tradeNameAr;
    data['trade_name_en'] = this.tradeNameEn;
    data['description_en'] = this.descriptionEn;
    data['description_ar'] = this.descriptionAr;
    data['commercial_price'] = this.commercialPrice;
    data['net_price'] = this.netPrice;
    data['company_id'] = this.companyId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    return data;
  }
}

class Company {
  int? id;
  String? nameAr;
  String? nameEn;
  String? createdAt;
  String? updatedAt;

  Company({this.id, this.nameAr, this.nameEn, this.createdAt, this.updatedAt});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Offer {
  int? id;
  int? demandQuantity;
  int? freeQuantity;
  int? warehousemedicineId;
  String? createdAt;
  String? updatedAt;

  Offer(
      {this.id,
        this.demandQuantity,
        this.freeQuantity,
        this.warehousemedicineId,
        this.createdAt,
        this.updatedAt});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    demandQuantity = json['demand_quantity'];
    freeQuantity = json['free_quantity'];
    warehousemedicineId = json['warehousemedicine_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['demand_quantity'] = this.demandQuantity;
    data['free_quantity'] = this.freeQuantity;
    data['warehousemedicine_id'] = this.warehousemedicineId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class LoadQuantity {
  int? id;
  int? loadQuantity;
  int? warehousemedicineId;
  int? loadId;
  String? createdAt;
  String? updatedAt;
  WarehouseMedicine? looad;

  LoadQuantity(
      {this.id,
        this.loadQuantity,
        this.warehousemedicineId,
        this.loadId,
        this.createdAt,
        this.updatedAt,
        this.looad});

  LoadQuantity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loadQuantity = json['load_quantity'];
    warehousemedicineId = json['warehousemedicine_id'];
    loadId = json['load_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    looad = json['looad'] != null
        ? new WarehouseMedicine.fromJson(json['looad'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['load_quantity'] = this.loadQuantity;
    data['warehousemedicine_id'] = this.warehousemedicineId;
    data['load_id'] = this.loadId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.looad != null) {
      data['looad'] = this.looad!.toJson();
    }
    return data;
  }
}
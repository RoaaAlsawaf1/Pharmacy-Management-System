class InvoicesDetails {
  List<DispenserInvoicesDetails>? dispenserInvoicesDetails;

  InvoicesDetails({this.dispenserInvoicesDetails});

  InvoicesDetails.fromJson(Map<String, dynamic> json) {
    if (json['DispenserInvoicesDetails'] != null) {
      dispenserInvoicesDetails = <DispenserInvoicesDetails>[];
      json['DispenserInvoicesDetails'].forEach((v) {
        dispenserInvoicesDetails!.add(new DispenserInvoicesDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dispenserInvoicesDetails != null) {
      data['DispenserInvoicesDetails'] =
          this.dispenserInvoicesDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DispenserInvoicesDetails {
  int? id;
  int? quantity;
  int? additional;
  int? price;
  int? invoiceId;
  int? warehouseMedicineId;
  String? createdAt;
  String? updatedAt;
  WarehouseMedicine? warehouseMedicine;

  DispenserInvoicesDetails(
      {this.id,
        this.quantity,
        this.additional,
        this.price,
        this.invoiceId,
        this.warehouseMedicineId,
        this.createdAt,
        this.updatedAt,
        this.warehouseMedicine});

  DispenserInvoicesDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    additional = json['additional'];
    price = json['price'];
    invoiceId = json['invoice_id'];
    warehouseMedicineId = json['warehouseMedicine_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    warehouseMedicine = json['warehouse_medicine'] != null
        ? new WarehouseMedicine.fromJson(json['warehouse_medicine'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['additional'] = this.additional;
    data['price'] = this.price;
    data['invoice_id'] = this.invoiceId;
    data['warehouseMedicine_id'] = this.warehouseMedicineId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.warehouseMedicine != null) {
      data['warehouse_medicine'] = this.warehouseMedicine!.toJson();
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
        this.updatedAt});

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
    return data;
  }
}
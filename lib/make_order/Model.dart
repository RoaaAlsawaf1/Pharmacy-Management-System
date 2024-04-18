class AllMedicine {
  List<WarehouseMedicines>? warehouseMedicines;

  AllMedicine({this.warehouseMedicines});

  AllMedicine.fromJson(Map<String, dynamic> json) {
    if (json['warehouseMedicines'] != null) {
      warehouseMedicines = <WarehouseMedicines>[];
      json['warehouseMedicines'].forEach((v) {
        warehouseMedicines!.add(new WarehouseMedicines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.warehouseMedicines != null) {
      data['warehouseMedicines'] =
          this.warehouseMedicines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WarehouseMedicines {
  int? id;
  int? maxQuantity;
  int? warehouseId;
  int? medicineId;
  String? createdAt;
  String? updatedAt;
  Medicine? medicine;
  List<Offer>? offer;
  List<Warehousemedicinesload>? warehousemedicinesload;

  WarehouseMedicines(
      {this.id,
        this.maxQuantity,
        this.warehouseId,
        this.medicineId,
        this.createdAt,
        this.updatedAt,
        this.medicine,
        this.offer,
        this.warehousemedicinesload});

  WarehouseMedicines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maxQuantity = json['max_quantity'];
    warehouseId = json['warehouse_id'];
    medicineId = json['medicine_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    medicine = json['medicine'] != null
        ? new Medicine.fromJson(json['medicine'])
        : null;
    if (json['offer'] != null) {
      offer = <Offer>[];
      json['offer'].forEach((v) {
        offer!.add(new Offer.fromJson(v));
      });
    }
    if (json['warehousemedicinesload'] != null) {
      warehousemedicinesload = <Warehousemedicinesload>[];
      json['warehousemedicinesload'].forEach((v) {
        warehousemedicinesload!.add(new Warehousemedicinesload.fromJson(v));
      });
    }
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
    if (this.offer != null) {
      data['offer'] = this.offer!.map((v) => v.toJson()).toList();
    }
    if (this.warehousemedicinesload != null) {
      data['warehousemedicinesload'] =
          this.warehousemedicinesload!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medicine {
  int? id;
  String? barcode;
  String? tradeNameAr;
  String? tradeNameEn;
  String? descriptionEn;
  String? descriptionAr;
  String? medicineFormAr;
  String? medicineFormEn;
  int? commercialPrice;
  int? netPrice;
  String? size;
  int? parts;
  int? companyId;
  String? medicinePhotoPath;
  String? createdAt;
  String? updatedAt;
  Company? company;

  Medicine(
      {this.id,
        this.barcode,
        this.tradeNameAr,
        this.tradeNameEn,
        this.descriptionEn,
        this.descriptionAr,
        this.medicineFormAr,
        this.medicineFormEn,
        this.commercialPrice,
        this.netPrice,
        this.size,
        this.parts,
        this.companyId,
        this.medicinePhotoPath,
        this.createdAt,
        this.updatedAt,
        this.company});

  Medicine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    barcode = json['barcode'];
    tradeNameAr = json['trade_name_ar'];
    tradeNameEn = json['trade_name_en'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    medicineFormAr = json['medicine_form_ar'];
    medicineFormEn = json['medicine_form_en'];
    commercialPrice = json['commercial_price'];
    netPrice = json['net_price'];
    size = json['size'];
    parts = json['parts'];
    companyId = json['company_id'];
    medicinePhotoPath = json['medicine_photo_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['barcode'] = this.barcode;
    data['trade_name_ar'] = this.tradeNameAr;
    data['trade_name_en'] = this.tradeNameEn;
    data['description_en'] = this.descriptionEn;
    data['description_ar'] = this.descriptionAr;
    data['medicine_form_ar'] = this.medicineFormAr;
    data['medicine_form_en'] = this.medicineFormEn;
    data['commercial_price'] = this.commercialPrice;
    data['net_price'] = this.netPrice;
    data['size'] = this.size;
    data['parts'] = this.parts;
    data['company_id'] = this.companyId;
    data['medicine_photo_path'] = this.medicinePhotoPath;
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

class Warehousemedicinesload {
  int? id;
  int? loadQuantity;
  int? warehousemedicineId;
  int? loadId;
  String? createdAt;
  String? updatedAt;
  Looad? looad;

  Warehousemedicinesload(
      {this.id,
        this.loadQuantity,
        this.warehousemedicineId,
        this.loadId,
        this.createdAt,
        this.updatedAt,
        this.looad});

  Warehousemedicinesload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loadQuantity = json['load_quantity'];
    warehousemedicineId = json['warehousemedicine_id'];
    loadId = json['load_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    looad = json['looad'] != null ? new Looad.fromJson(json['looad']) : null;
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

class Looad {
  int? id;
  int? maxQuantity;
  int? warehouseId;
  int? medicineId;
  String? createdAt;
  String? updatedAt;
  Medicine? medicine;

  Looad(
      {this.id,
        this.maxQuantity,
        this.warehouseId,
        this.medicineId,
        this.createdAt,
        this.updatedAt,
        this.medicine});

  Looad.fromJson(Map<String, dynamic> json) {
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
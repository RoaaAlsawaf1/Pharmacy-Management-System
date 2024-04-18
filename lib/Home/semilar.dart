class AlternativesMedicine {
  List<Alternatives>? alternatives;

  AlternativesMedicine({this.alternatives});

  AlternativesMedicine.fromJson(Map<String, dynamic> json) {
    if (json['alternatives'] != null) {
      alternatives = <Alternatives>[];
      json['alternatives'].forEach((v) {
        alternatives!.add(new Alternatives.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.alternatives != null) {
      data['alternatives'] = this.alternatives!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Alternatives {
  int? id;
  int? quantity;
  int? pharmacyId;
  int? medicineId;
  String? createdAt;
  String? updatedAt;
  Medicine? medicine;

  Alternatives(
      {this.id,
        this.quantity,
        this.pharmacyId,
        this.medicineId,
        this.createdAt,
        this.updatedAt,
        this.medicine});

  Alternatives.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    pharmacyId = json['pharmacy_id'];
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
    data['quantity'] = this.quantity;
    data['pharmacy_id'] = this.pharmacyId;
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
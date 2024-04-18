class GetDispenserWork {
  List<Dispensers>? dispensers;

  GetDispenserWork({this.dispensers});

  GetDispenserWork.fromJson(Map<String, dynamic> json) {
    if (json['dispensers'] != null) {
      dispensers = <Dispensers>[];
      json['dispensers'].forEach((v) {
        dispensers!.add(new Dispensers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dispensers != null) {
      data['dispensers'] = this.dispensers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dispensers {
  int? id;
  int? warehouseId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  User? user;

  Dispensers(
      {this.id,
        this.warehouseId,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.user});

  Dispensers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    warehouseId = json['warehouse_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['warehouse_id'] = this.warehouseId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? phoneNumber;
  String? gender;
  String? email;
  Null? age;
  Null? emailVerifiedAt;
  int? locationId;
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
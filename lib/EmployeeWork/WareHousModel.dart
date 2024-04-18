class JobwarehousesEmployee {
  List<Jobwarehouses>? jobwarehouses;

  JobwarehousesEmployee({this.jobwarehouses});

  JobwarehousesEmployee.fromJson(Map<String, dynamic> json) {
    if (json['jobwarehouses'] != null) {
      jobwarehouses = <Jobwarehouses>[];
      json['jobwarehouses'].forEach((v) {
        jobwarehouses!.add(new Jobwarehouses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobwarehouses != null) {
      data['jobwarehouses'] =
          this.jobwarehouses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Jobwarehouses {
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

  Jobwarehouses(
      {this.id,
        this.userId,
        this.warehouseName,
        this.number,
        this.pathOfPhoto,
        this.ownerOfPermissionName,
        this.validated,
        this.locationId,
        this.createdAt,
        this.updatedAt});

  Jobwarehouses.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['warehouseName'] = this.warehouseName;
    data['number'] = this.number;
    data['path_of_photo'] = this.pathOfPhoto;
    data['owner_of_permission_name'] = this.ownerOfPermissionName;
    data['validated'] = this.validated;
    data['location_id'] = this.locationId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
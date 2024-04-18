class UserModel {
  int? id;
  String? name;
  String? phoneNumber;
  String? gender;
  String? email;
  int? age;
  String? emailVerifiedAt;
  int? locationId;
  int? adminLevel;
  String? createdAt;
  String? updatedAt;



  UserModel.fromJson(Map<String, dynamic> json) {
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


}
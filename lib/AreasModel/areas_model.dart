class AreasModel {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  List<Areas>? areas;



  AreasModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['areas'] != null) {
      areas = <Areas>[];
      json['areas'].forEach((v) {
        areas!.add( Areas.fromJson(v));
      });
    }
  }


}

class Areas {
  int? id;
  String? name;
  int? cityId;
  String? createdAt;
  String? updatedAt;
  City? city;



  Areas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
  }


}

class City {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;



  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}
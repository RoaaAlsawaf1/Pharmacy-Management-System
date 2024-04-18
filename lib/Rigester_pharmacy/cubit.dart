import 'package:get/get.dart' ;
import 'package:hexcolor/hexcolor.dart';
import 'package:path/path.dart' as path;
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/Model/Register_pharmacy.dart';
import 'package:pharmacy/Rigester_pharmacy/states.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';
import 'package:decimal/decimal.dart';
import '../shared/network/remote/dio_helper.dart';

//Pharmacy
class PharmacyRegisterCubit extends Cubit<PharmacyRegisterStates> {
  PharmacyRegisterCubit() : super(PharmacyAddInitialState());

  static PharmacyRegisterCubit get(context) => BlocProvider.of(context);

  String? selectedItemGender = "44".tr;

  String? selectedItemCity = "46".tr;

  String? selectedItemDay= "Sun";
  IconData suffix=Icons.visibility_outlined;
  bool isPasswordShown=true;
  void changePasswordVisibility(){
    isPasswordShown=!isPasswordShown;
    suffix=isPasswordShown?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ChangePassWordVisibilityState ());
  }

  void changeDropDownGender(item){
  selectedItemGender = item;

  }

  void changeDropDownCity(item){
    selectedItemCity = item;
    emit(PharmacyChangeDropCityState());
  }
  void changeDropDownDay(item){
    selectedItemDay = item;
    emit(PharmacyChangeDropCityState());
  }


  Future<void> pharmacyRegister({
    required String pharmacyName,
    required String number,
    required  longitude,
    required   latitude,
    required  image,
    required location_desc,

    required from_min,
    required to_min
  }) async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر
    emit(PharmacyAddLoadingState());
    print("pharmacyLoadingState");

     dio.FormData formData = dio.FormData.fromMap(
      {  "location_desc":location_desc,
        'area_id':selectedAllCityId,
        "pharmacyName":pharmacyName,
        "number":number,
        "longitude":longitude,
        "latitude":latitude,
        "img":await dio.MultipartFile.fromFile(image,filename:'image.jpg'),
        "from_min":from_min,
          "to_min":to_min,
        "holiday_id":selectedDayId,
      }
    );

    DioHelper.postDataPharmacy(

        url:"pharmacy/register",
        token:CacheHelper.getData(key: 'accessToken'),

        data: formData //post=>body=>from_data
    ).then((value){
      print("pharmacydata");


      emit(PharmacyAddSuccessState(value.statusCode));
      print("pharmacySuccessState");

    }).catchError((error){
      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;


      emit(PharmacyAddErrorState(statusCode));
      print(statusCode);

    });
  }
  late int idPharmacyOrder;
  List<dynamic>day=[];
  late String selectedDay = day[0]['name']; // تعريف متغير لتخزين اسم الدواء المختار
  late int selectedDayId = day[0]['id']; // تعريف متغير لتخزين id الدواء المختار

  List<DropdownMenuItem<String>> dayDropDownItems = []; // تعريف قائمة الادوية

  void getMedicinesDropDownItems() {
    dayDropDownItems = day.map((day) {
      return DropdownMenuItem<String>(
        value: day['name'],
        child: Text(day['name'],style: TextStyle(color: HexColor("6C6D72"),
            fontSize: 14)),
      );
    }).toList();

  }

   changeSelectedMedicine(String days) {
     getMedicinesDropDownItems();
    selectedDay = days;
    selectedDayId = day.firstWhere((day) => day['name'] == days)['id'];
    return  selectedDay;
  }

  Future<void>getDay()async {

    DioHelper.getData(url:'days').then((value){
  day=value.data;
  }).catchError((error){

  });
}
  List<dynamic>allCity=[];
  late String selectedAllCity = allCity[0]['name_en']; // تعريف متغير لتخزين اسم الدواء المختار
  late int selectedAllCityId = allCity[0]['id']; // تعريف متغير لتخزين id الدواء المختار

  List<DropdownMenuItem<String>> allCityDropDownItems = []; // تعريف قائمة الادوية

  void getAllCityDropDownItems() {
    allCityDropDownItems = allCity.map((city) {
      return DropdownMenuItem<String>(
        value: city['name_en'],
        child: Text(city['name_en'],style: TextStyle(color: HexColor("6C6D72"),
            fontSize: 14)),
      );
    }).toList();

  }

  changeSelectedCity(String days) {
    selectedAllCity = days;
    selectedAllCityId= allCity.firstWhere((day) => day['name_en'] == days)['id'];
    return  selectedAllCity;
  }

  Future<void>getAllCity()async{
    print("Get All City");
    DioHelper.getData(url:"places" ).then((value){
      print(value.statusCode);
      allCity=value.data;
      print(value.data);

    }).catchError((error){

      int statusCode = error.response?.statusCode ?? -1;
      print(error.response.toString());

    });
  }

}

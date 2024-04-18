import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Rigester_Warehouse/states.dart';

import 'package:dio/dio.dart' as dio;
import 'package:pharmacy/shared/network/local/cache_helper.dart';
import 'package:pharmacy/shared/network/remote/dio_helper.dart';
//warehouse
class WarehouseRegisterCubit extends Cubit<WarehouseRegisterStates> {
  WarehouseRegisterCubit() : super(WarehouseInitialState());

  static WarehouseRegisterCubit get(context) => BlocProvider.of(context);

  String? selectedItemGender = "44".tr;

  String? selectedItemCity = "46".tr;

  IconData suffix=Icons.visibility_outlined;
  bool isPasswordShown=true;
  void changePasswordVisibility(){
    isPasswordShown=!isPasswordShown;
    suffix=isPasswordShown?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ChangePassWordVisibilityState ());
  }

  void changeDropDownGender(item){
  selectedItemGender = item;
      emit(WarehouseChangeDropGenderState());
  }

  void changeDropDownCity(item){
    selectedItemCity = item;
    emit(WarehouseChangeDropCityState());
  }

  Future<void> pharmacyRegister({
    required String pharmacyName,
    required String number,
   required  img,
    required location_desc,

  }) async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر
    emit(WarehouseLoadingState());
    print("pharmacyLoadingState");

    dio.FormData formData = dio.FormData.fromMap(
        {  "location_desc":location_desc,
          'area_id':selectedAllCityId,
          "warehouseName":pharmacyName,
          "number":number,
          "img":await dio.MultipartFile.fromFile(img,filename:'image.jpg')


        }
    );

    DioHelper.postDataPharmacy(

        url:"warehouse/register",
        token:CacheHelper.getData(key: 'accessToken'),

        data: formData //post=>body=>from_data
    ).then((value){
      print("pharmacydata");


      emit(WarehouseSuccessState(value.statusCode));
      print("pharmacySuccessState");
      print(value.data);

    }).catchError((error){
      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;


      emit(WarehouseErrorState(statusCode));
      print(statusCode);

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
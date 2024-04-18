import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/EmployeeWork/ModelDetails.dart';
import 'package:pharmacy/EmployeeWork/ModelForOrderWare.dart';
import 'package:pharmacy/EmployeeWork/WareHousModel.dart';
import 'package:pharmacy/EmployeeWork/getDisModelWork.dart';
import 'package:pharmacy/Home/Pharmacy_Model.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/Home/semilar.dart';
import 'package:pharmacy/Model/Register_pharmacy.dart';
import 'package:pharmacy/Model/UserModel.dart';
import 'package:pharmacy/MyWarehouse/modelMedicineWareHouse.dart';
import 'package:pharmacy/dashboard/cubit/ModelDashBordPharmacy.dart';
import 'package:pharmacy/dashboard/cubit/ModelDshBordWarehouse.dart';
import 'package:pharmacy/make_order/MedicineSearchPharmacy.dart';
import 'package:pharmacy/make_order/Model.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';
import 'package:pharmacy/shared/network/remote/dio_helper.dart';

import '../Pharmacy_model_medicine_one_page.dart';

class PharmacyHomeCubit extends Cubit<PharmacyHomeStates>{
  PharmacyHomeCubit():super(PharmacyInitialState());
  static PharmacyHomeCubit get(context) => BlocProvider.of(context);
  String? selectedItemMedicine ="Medicine";
  //////////////////////////////////////////////for create order map
late Map<dynamic, dynamic> dataMapMy;
late  List<Map<String, dynamic>> showOrder ;

 removeShowMap(int index){
    showOrder.remove(showOrder[index]);

   return showOrder;
  }
  dataMap(int index){
   print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
    dataMapMy.remove(index);

    return dataMapMy;
  }
  removeShowMapClear(){
    visibilityAdd = List.filled(countVisibilityAdd, true);
    visibilityRemove=List.filled(countVisibilityRemove, false);
    checked=List.filled(countNumberMedicine, false);
    showOrder.clear();

    return showOrder;
  }
  dataMapclear(){
    visibilityAdd = List.filled(countVisibilityAdd, true);
    visibilityRemove=List.filled(countVisibilityRemove, false);
    checked=List.filled(countNumberMedicine, false);
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
    dataMapMy.clear();

    return dataMapMy;
  }
  late int countVisibilityAdd;
  List<bool> visibilityAdd=[];
  late int countVisibilityRemove;
  List<bool>visibilityRemove=[];
  late int countNumberMedicine;
  List<bool>checked=[];
  changeChecked( index){
    checked[index]=!checked[index];

  }
  changeVisibilityAdd( index){
    visibilityAdd[index]=!visibilityAdd[index];

  }
  changeVisibilityRemove( index){
    visibilityRemove[index]=!visibilityRemove[index];

  }

  //////////////////////////////////////////////////////////////////for medicine dropdown
  late int idPharmacyOrder;
  List<dynamic> MedicinesWareHous =[

  ];
 late String selectedMedicine = MedicinesWareHous[0]['medicine']['trade_name_en']; // تعريف متغير لتخزين اسم الدواء المختار
  late int selectedMedicineId = MedicinesWareHous[0]['id']; // تعريف متغير لتخزين id الدواء المختار

  List<DropdownMenuItem<String>> medicinesDropDownItems = []; // تعريف قائمة الادوية

   void getMedicinesDropDownItems() {
  medicinesDropDownItems = MedicinesWareHous.map((medicine) {
     return DropdownMenuItem<String>(
      value: medicine['medicine']['trade_name_en'],
      child: Text(medicine['medicine']['trade_name_en'],style: TextStyle(color: HexColor("6C6D72"),
           fontSize: 14)),
     );
   }).toList();
  print(medicinesDropDownItems);
}

  changeSelectedMedicine(String medicineName) {
   selectedMedicine = medicineName;
  selectedMedicineId = MedicinesWareHous.firstWhere((medicine) => medicine['medicine']['trade_name_en'] == medicineName)['id'];
return selectedMedicine;
}
/////////////////////////////////////////////////////////////////////////////////////for get warehouses in app
  List<dynamic> allWarehouseForPharmacy =[

  ];
 late String selectedWarehouse =allWarehouseForPharmacy[0]['warehouseName']; // تعريف متغير لتخزين اسم الدواء المختار
  late int selectedWarehouseId = allWarehouseForPharmacy[0]['id']; // تعريف متغير لتخزين id الدواء المختار

  List<DropdownMenuItem<String>> warehouseDropDownItems = []; // تعريف قائمة الادوية
  void getWarehouseDropDownItems() {
    warehouseDropDownItems = allWarehouseForPharmacy.map((warehouse) {
      return DropdownMenuItem<String>(
        value: warehouse['warehouseName'],
        child: Text(warehouse['warehouseName'],style: TextStyle(color: HexColor("6C6D72"),
            fontSize: 14)),
      );
    }).toList();

  }
   changeSelectedWarehouse(String warehouseName) {
    selectedWarehouse = warehouseName;
    selectedWarehouseId = allWarehouseForPharmacy.firstWhere((warehouse) => warehouse['warehouseName'] == warehouseName)['id'];
return selectedWarehouse;
  }

//////////////////////////////////////////////////////////////////////////////////////
  void changeDropDown(item){
    selectedItemMedicine  = item;

  }
  void singOut(){

    emit(PharmacyLoadingState());
    DioHelper.getDataSingOut(
      url:"user/logout",
      token:CacheHelper.getData(key: 'accessToken'),
    ).then((value)
    {


      emit(PharmacySuccessState(value.statusCode));
      print("hhhhh");
    }
    ).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;
      emit(PharmacyErrorState(statusCode));
    });
  } ///////////////////////////////////////////////////////////////////for signout
  late ModelPharmacy modelPharmacy;
////////////////////////////////////////////////////////////////for get MyPharmacy and My Warehous
  Future<void>getPharmacyAndWarehouse()async {
    emit(PharmacyWLoadingState());
    DioHelper.getData(url: "user/get", token:CacheHelper.getData(key: 'accessToken'), ).then((value) {
      modelPharmacy=ModelPharmacy.fromJson(value.data);
      emit(PharmacyWSuccessState(value.statusCode,modelPharmacy));

    }).catchError((error){
      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;


      emit(PharmacyWErrorState(statusCode));
      print(statusCode);
    });
  }
  /////////////////////////////////////////////////////////////////for get user information
  late UserModel userModel;
  void getUser(){
    emit(UserLoadingDataState());

    DioHelper.postDataUser(url:'user'
      ,token:CacheHelper.getData(key: 'accessToken'),
    ).then((value){
      print(" succ");
      userModel=UserModel.fromJson(value.data);
      print(userModel);
      print(userModel.adminLevel);
      print(CacheHelper.getData(
          key: 'adminLevel'));
      CacheHelper.saveData(
          key: 'adminLevel', value:userModel.adminLevel);
      CacheHelper.saveData(
          key: 'iiiii', value:userModel.id);
      print(CacheHelper.getData(
          key: 'iiiii'));
      emit(UserSuccessDataState(value.statusCode,userModel));
    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(UserErrorDataState(statusCode));
      print(error);
      print(statusCode);
    });
  }
  ////////////////////////////////////////////////////////////////////dashBord all pharmacy Validated
  late DashBordPharmacy dashBordPharmacy;

  Future<void>getPharmacy()async {
    emit(PharmacyDashBordLoadingState());
    print("PharmacyDashBordLoadingState");
    DioHelper.getData(url: "admin/showNotValidatedPharmacies", token:CacheHelper.getData(key: 'accessToken'), ).
    then((value) {
      print(value.data);
      dashBordPharmacy=DashBordPharmacy.fromJson(value.data);

      emit(PharmacyDashBordSuccessState(dashBordPharmacy,value.statusCode));
      print("PharmacyDashBordSuccessState");
     getWarehouse();
    }).catchError((error){
      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;


      emit(PharmacyDashBordErrorState(statusCode));
      print(statusCode);
    });
  }

  Future<void> validation({/////////////////////////////////////////button validation in dashBord pharmacy
    required int id,
    required String owner_of_Permission_name,

  }) async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر
    emit(ValidationLoadingState());
    print("UserLoadingState");

    print("respons");

    DioHelper.postData(

        url:"admin/validatePharmacy",
        token:CacheHelper.getData(key: 'accessToken'),

        data: {
           "id":id,
          "owner_of_Permission_name":owner_of_Permission_name
          } //post=>body=>from_data

    ).then((value){
      print("data");


      emit(ValidationSuccessState(value.statusCode));
      print("Validation success");

    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(ValidationErrorState(statusCode));
      print(error.respons.toString());
      print(statusCode);

    });
  }
//////////////////////////////////////////////////////////////////////button delete in dashBord pharmacy
    Future<void>delete({
    required int id
})async{
      emit(DeletePharmacyLoadingDataState());
    DioHelper.delete(url: "admin/deletePharmacy",data: {
      "id":id,

    },
        token:CacheHelper.getData(key: 'accessToken')
    ).then((value) {
      emit(DeletePharmacySuccessDataState(value));
    }).catchError((error){
      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;
      emit(DeletePharmacyErrorDataState(error));

    });
}
////////////////////////////////////////////////////////////////////dashBord all warehouse Validated
  late DashBordWarehouse dashBordWarehouse ;

  Future<void>getWarehouse()async {
    emit(WarehouseDashBordLoadingState());
    print("WarehouseDashBordLoadingState");
    DioHelper.getData(url: "admin/showNotValidatedWarehouses", token:CacheHelper.getData(key: 'accessToken'), ).then((value) {
      dashBordWarehouse=DashBordWarehouse.fromJson(value.data);
      emit(WarehouseDashBordSuccessState(dashBordWarehouse,value.statusCode));
      print("WarehouseDashBordSuccessState");

    }).catchError((error){
      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;


      emit(WarehouseDashBordErrorState(statusCode));
      print(statusCode);
    });
  }
  /////////////////////////////////////////button validation in dashBord warehouse
  Future<void> validationWarehouse({
    required int id,
    required String owner_of_Permission_name,

  }) async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر
    emit(WarehouseValidationLoadingState());
    print("WarehouseLoadingState");

    print("respons");

    DioHelper.postData(

        url:"admin/validateWarehouse",
        token:CacheHelper.getData(key: 'accessToken'),

        data: {
          "id":id,
          "owner_of_Permission_name":owner_of_Permission_name
        } //post=>body=>from_data

    ).then((value){
      print("data");


      emit(WarehouseValidationSuccessState(value.statusCode));
      print("Warehouse Validation success");

    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(WarehouseValidationErrorState(statusCode));
      print(error.respons.toString());
      print(statusCode);

    });
  }
////////////////////////////////////////////////////////button delete in dashBord warehouse
  Future<void>deleteWarehouse({
    required int id
  })async{
    emit(DeleteWarehouseLoadingDataState());
    DioHelper.delete(url: "admin/deleteWarehouse",data: {
      "id":id,

    },
        token:CacheHelper.getData(key: 'accessToken')
    ).then((value) {
      emit(DeleteWarehouseSuccessDataState(value));
    }).catchError((error){

      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;
      emit(DeleteWarehouseErrorDataState(error));

    });
  }
  /////////////////////////////////////////////////////////////create admin in dashbord
  Future<void> addAdmin({

    required String email,

  }) async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر
    emit(AddAdminLoadingDataState());
    print("AddAdminLoadingDataState");



    DioHelper.postData(

        url:"admin/makeAdmin",
        token:CacheHelper.getData(key: 'accessToken'),

        data: {
          "email":email
        } //post=>body=>from_data

    ).then((value){
      print("data");


      emit(AddAdminSuccessDataState(value.statusCode));
      print("AddAdminDataState success");

    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(AddAdminErrorDataState(statusCode));
      print(error.respons.toString());
      print(statusCode);

    });
  }
//////////////////////////////////////////////////////////////// addMaterial

Future<void> addMaterial({

  required String name_en,
  required String name_ar,

}) async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر
  emit(MLoadingDataState());
  print("MLoadingDataState");



  DioHelper.postData(

      url:"admin/createActiveMat",
      token:CacheHelper.getData(key: 'accessToken'),

      data: {
        "name_en":name_en,
        "name_ar":name_ar,

      } //post=>body=>from_data

  ).then((value){
    print("data");


    emit(MSuccessDataState(value.statusCode));

  }).catchError((error){
    int statusCode = error.response?.statusCode ?? -1;

    emit(MErrorDataState(statusCode));
    print(error.respons.toString());
    print(statusCode);

  });
}

/////////////////////////////////////////////////////////////add company
Future<void> addCompany({

  required String name_en,
  required String name_ar,

}) async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر
  emit(CLoadingDataState());



  DioHelper.postData(

      url:"admin/createCompany",
      token:CacheHelper.getData(key: 'accessToken'),

      data: {
        "name_en":name_en,
        "name_ar":name_ar
      } //post=>body=>from_data

  ).then((value){


    emit(CSuccessDataState(value.statusCode));

  }).catchError((error){
    int statusCode = error.response?.statusCode ?? -1;

    emit(CErrorDataState(statusCode));
    print(error.respons.toString());
    print(statusCode);

  });
}
//////////////////////////////////////////////////////////////////////////////search warehouse
  List<dynamic> SearchMedicines =[];

  Future<void> getSearch({

    required  value,
    required  id
  }) async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر
    emit(MapSearchLoadingState());
    print("UserLoadingState");
    //print(value);
    print(CacheHelper.getData(key: 'accessToken'));

    print("respons");

    await  DioHelper.getData(

      url:"warehouse/showMedicines/$id",
      query: {
        'search':'$value',
      },
      token:CacheHelper.getData(key: 'accessToken'),


    ).then((value){
      SearchMedicines = value.data;
      print(SearchMedicines);

      emit(MapSearchSuccessState());


    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;
     print(error.response.toString());
      emit(MapSearchErrorState(statusCode));
      print("pp ${error.toString()}");
      print(statusCode);

    });
  }
  //////////////////////////////////////////////////////////////////update updateMedicineWarehouse
  Future<void> updateMedicineWarehouse({

    required  warehouseMedicine_id,
    required  max_quantity,


  }) async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر
    emit(UpdateLoadingState());



    DioHelper.postData(

        url:"warehouse/editMedicine",
        token:CacheHelper.getData(key: 'accessToken'),

        data: {
          "warehouseMedicine_id":warehouseMedicine_id,
          "max_quantity":max_quantity,



        } //post=>body=>from_data

    ).then((value){

      emit(UpdateSuccessState(value.statusCode));

    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(UpdateErrorState(statusCode));
      print(error.respons);
      print(statusCode);

    });
  }
  /////////////////////////////////////////////////////////////////////////////search pharmacy
late  medicinePharmacy SearchMedicinesPharmacy  ;

  Future<void> getSearchPharmacy({
    required  value,
    required  id
  }) async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر
    emit(PharmacySearchLoadingState());
    print("UserLoadingState");
    //print(value);

    print("respons");

    await  DioHelper.getData(

      url:"pharmacy/showMedicines/$id",
      query: {
        'search':'$value',
      },
      token:CacheHelper.getData(key: 'accessToken'),


    ).then((value){
      print(value.data);
      SearchMedicinesPharmacy = medicinePharmacy.fromJson(value.data);

      print(SearchMedicines);

      emit(PharmacySearchSuccessState());


    }).catchError((error){
     // int statusCode = error.response?.statusCode ?? -1;
     // print(error.response.toString());
      emit(PharmacySearchErrorState());
      print("pp ${error.toString()}");
     // print(statusCode);

    });
  }
  //////////////////////////////////////////////////////////////////////////updateMedicinePharmacy
  Future<void> updateMedicinePharmacy({

    required  quantity,
   // required  net_price,
   // required  commercial_price,
    required  pharmacyMedicine_id

  }) async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر
    emit(PhUpdateLoadingState());



    DioHelper.postData(

        url:"pharmacy/editMedicine",
        token:CacheHelper.getData(key: 'accessToken'),

        data: {

          "quantity":quantity,
         // "net_price":net_price,
         //"commercial_price":commercial_price,
           "pharmacyMedicine_id":pharmacyMedicine_id

        } //post=>body=>from_data

    ).then((value){

      emit(PhUpdateSuccessState(value.statusCode));

    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(PhUpdateErrorState(statusCode));
      print(error.respons);
      print(statusCode);

    });
  }
/////////////////////////////////////////////////////////////////////////////////offerAddMedicineWarehouse
  Future<void> offerAddMedicineWarehouse({

    required  warehouseMedicine_id,
    required  demand_quantity,
    required  free_quantity,

  }) async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر
    emit(AddOffersLoadingState());



    DioHelper.postData(

        url:"warehouse/createOffer",
        token:CacheHelper.getData(key: 'accessToken'),

        data: {
          "warehouseMedicine_id":warehouseMedicine_id,
          "demand_quantity":demand_quantity,
          "free_quantity":free_quantity


        } //post=>body=>from_data

    ).then((value){

      emit(AddOffersSuccessState(value.statusCode));

    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(AddOffersErrorState(statusCode));
      print(error.respons);
      print(statusCode);

    });
  }
////////////////////////////////////////////////////////////////////deleteOffers
  Future<void>deleteOffers({
    required  offer_id
  })async{
    emit(DeleteOffersLoadingState());
    DioHelper.delete(url: "warehouse/deleteOffer",data: {
      "offer_id":offer_id,

    },
        token:CacheHelper.getData(key: 'accessToken')
    ).then((value) {

      emit(DeleteOffersSuccessState(value.statusCode));
    }).catchError((error){
      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;
      emit(DeleteOffersErrorState(statusCode));

    });
  }
  //////////////////////////////////////////////////////////////////deleteLoad
  Future<void>deleteLoad({
    required  Warehousemedicines_load_id
  })async{
    emit(DeleteLoadsLoadingState());
    DioHelper.delete(url: "warehouse/deleteLoad",data: {
      "Warehousemedicines_load_id":Warehousemedicines_load_id,

    },
        token:CacheHelper.getData(key: 'accessToken')
    ).then((value) {
      emit(DeleteLoadsSuccessState(value.statusCode));
    }).catchError((error){
      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;
      emit(DeleteLoadsErrorState(statusCode));

    });
  }
//////////////////////////////////////////////////////////////////LoadAddMedicineWarehouse
  Future<void> LoadAddMedicineWarehouse({

    required  warehouseMedicine_id,
    required  load_quantity,


  }) async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر
    emit(AddLoadsLoadingState());



    DioHelper.postData(

        url:"warehouse/createLoad",
        token:CacheHelper.getData(key: 'accessToken'),

        data: {
          "warehouseMedicine_id":warehouseMedicine_id,
          "load_quantity":load_quantity,
          "load_id":selectedMedicineId


        } //post=>body=>from_data

    ).then((value){

      emit(AddLoadsSuccessState(value.statusCode));

    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(AddLoadsErrorState(statusCode));
      print(error.respons);
      print(statusCode);

    });
  }

//////////////////////////////////////////////////////////////////////////showMedicines warehouse
//   late MedicineWareHouseAll medicineWareHouseAll;
Future<void> getMedicineSearch({

  required  id

}) async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر
  print("UserLoadingState");
  //print(value);
  print(CacheHelper.getData(key: 'accessToken'));
  print("respons");
  await  DioHelper.getData(

    url:"warehouse/showMedicines/$id",
    query: {
      'search':' ',
    },
    token:CacheHelper.getData(key: 'accessToken'),


  ).then((value){
    MedicinesWareHous = value.data;

    print(SearchMedicines);
 }).catchError((error){
    int statusCode = error.response?.statusCode ?? -1;
    print(error.response.toString());
    emit(MapSearchErrorState(statusCode));
    print("pp ${error.toString()}");
    print(statusCode);

  });
}
///////////////////////////////////////////////////////////////////////getOffers
  List<dynamic>offerss=[];
  Future<void> getOffers({
    required  id
  }) async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر

 emit(GetOffersLoadingState());
    await  DioHelper.getData(

      url:"warehouse/showOffers/$id",
      token:CacheHelper.getData(key: 'accessToken'),


    ).then((value){
      print(value.data);
      offerss=value.data;
      print(offerss);
      print("GetOffersSuccessState");
      emit(GetOffersSuccessState(value.statusCode));
    }).catchError((error){

      int statusCode = error.response?.statusCode ?? -1;
      print(error.response.toString());
      emit(GetOffersErrorState(statusCode));
      print("pp ${error.toString()}");
      print(statusCode);

    });
  }
///////////////////////////////////////////////////////////////////////getloads
  List<dynamic>loads=[];
  Future<void> getLoads({
    required  id
  }) async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر

    emit(GetLoadsLoadingState());
    await  DioHelper.getData(

      url:"warehouse/showLoads/$id",
      token:CacheHelper.getData(key: 'accessToken'),


    ).then((value){

      loads=value.data;
      print("GetLoadsSuccessState");

      emit(GetLoadsSuccessState(value.statusCode));
    }).catchError((error){

      int statusCode = error.response?.statusCode ?? -1;
      print(error.response.toString());
      emit(GetLoadsErrorState(statusCode));
      print("pp ${error.toString()}");
      print(statusCode);

    });
  }
 ///////////////////////////////////////////////////////////////////make order

 late AllMedicine allMedicine;
  Future<void> getWarehouseMedicineAndOffers({
    required  id
  }) async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر
 print("www");
   emit(GetWarehouseMedicineAndOffersLoadingState());
    await  DioHelper.getData(

      url:"/warehouse/existMedicines/$id",
      query: {
        'search':' ',
      },
      token:CacheHelper.getData(key: 'accessToken'),


    ).then((value){
      print("www");
    print(value);

      allMedicine=AllMedicine.fromJson(value.data);
      countNumberMedicine=allMedicine.warehouseMedicines!.length;
      countVisibilityAdd=allMedicine.warehouseMedicines!.length;
      countVisibilityRemove=allMedicine.warehouseMedicines!.length;
      visibilityAdd = List.filled(countVisibilityAdd, true);
      visibilityRemove=List.filled(countVisibilityRemove, false);
      checked=List.filled(countNumberMedicine, false);

      emit(GetWarehouseMedicineAndOffersSuccessState(value.statusCode));


    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;
      print(error.response.toString());
      emit(GetWarehouseMedicineAndOffersErrorState(statusCode));
      print("pp ${error.toString()}");
      print(statusCode);

    });
  }
////////////////////////////////////////////////////////////////////////allWarehouseForPharmacy


  Future<void> getShowWarehouse() async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر
    await  DioHelper.getData(
      url:"warehouse/show",
      token:CacheHelper.getData(key: 'accessToken'),
    ).then((value){
      allWarehouseForPharmacy=value.data;
      print(allWarehouseForPharmacy[0]['warehouseName']);

       }).catchError((error){

      int statusCode = error.response?.statusCode ?? -1;
      print(error.response.toString());

      print("pp ${error.toString()}");
      print(statusCode);

    });
  }
  ///////////////////////////////////////////////////////////////////////////////create order
  Future<void>createOrder({
  required dataMap,
    required time,
})async{
    print(dataMapMy);
    emit(CreateOrderLoadingState());
  Map<String, dynamic> data = {
  "date": time,
  "warehouse_id": selectedWarehouseId,
  "pharmacy_id": idPharmacyOrder,
    "medicines": dataMapMy
};
    DioHelper.postData(url:'order/register', data: data, token:CacheHelper.getData(key: 'accessToken'),)
        .then((value) {
          print("jsjssjjsjss");
      emit(CreateOrderSuccessState(value.statusCode));


}).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;
      print('error');
      print(error.response.toString());
      emit(CreateOrderErrorState(statusCode));

    });
}
//////////////////////////////////////////////////////////////////////////////////////add employee to warehouse
  Future<void> addemployeetowarehouse({

    required String employeeemail,

  }) async {
    emit(WarehouseAddEmpLoadingState());
    print("WarehouseAddEmpLoginWithGoogleState");

    print("respons");

    await DioHelper.postData(

      url:"warehouse/makeEmployee",


      data: {
        'warehouse_id':CacheHelper.getData(key: "idW"),
        'employeeEmail':employeeemail
      } //post=>body=>from_data
      ,
      token:CacheHelper.getData(key: 'accessToken'),

    ).then((value){
      print("succesful");


      print(value.data.toString());
      emit(WarehouseAddEmpSuccessState(value.statusCode));

      print(value.statusCode);
      // print(value.data);
      print("WarehouseAddEmpSuccessState");

    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(WarehouseAddEmpErrorState(statusCode));
      print(error);
      print(statusCode);

    });
  }
//////////////////////////////////////////////////////////////////////////////////add dispenser to warehouse
  Future<void> adddispensertowarehouse({

    required String dispensereemail,

  }) async {
    emit(WarehouseAddDisLoadingState());
    print("WarehouseAddDisLoadingState");

    print("respons");

    await DioHelper.postData(

      url:"warehouse/makeDispenser",


      data: {
        'warehouse_id': CacheHelper.getData(key: "idW"),
        'dispenserEmail':dispensereemail
      } //post=>body=>from_data
      ,
      token:CacheHelper.getData(key: 'accessToken'),

    ).then((value){
      print("succesful");


      print(value.data.toString());
      emit(WarehouseAddDisSuccessState(value.statusCode));

      print(value.statusCode);
      // print(value.data);
      print("WarehouseAddDisSuccessState");

    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;
      print(error.response);
      emit(WarehouseAddDisErrorState(statusCode));
      print(error);
      print(statusCode);

    });
  }



  Future<void> createMedicine({

    required  trade_name_ar,
    required trade_name_en,
    required description_ar,
    required description_en,
    required meicine_form_ar,
    required meicine_form_en,
    required commercial_price,
    required net_price,
    required size,
    required parts,
    required img,
    required company_id,
    required active_mats_active_mat_ar,
    required active_mats_active_mat_en,
    required active_mats_concentration,

  }) async {
dio.FormData formData = dio.FormData.fromMap(
    {"barcode":"asdad44",
      "trade_name_ar":trade_name_ar,
      "trade_name_en":trade_name_en,
      "description_ar":description_ar,
      "description_en":description_en,
      "medicine_form_ar":meicine_form_ar,
      "medicine_form_en":meicine_form_en,
      "commercial_price":commercial_price,
      "net_price":net_price,
      "size":size,
      "parts":parts,
      "company_id":company_id,
      "active_mats[0][active_mat_ar]":active_mats_active_mat_ar,
      "active_mats[0][active_mat_en]":active_mats_active_mat_en,
      "active_mats[0][concentration]":active_mats_concentration,

      "img":await dio.MultipartFile.fromFile(img,filename:'image.jpg'),

    }
);

    emit(CreateMedicineWarehouseAddDisLoadingState());
    print("CreateMedicineWarehouseAddDisLoadingState");

    await DioHelper.postDataPharmacy(

      url:"admin/createMedicine",


      data: formData, //post=>body=>from_data

      token:CacheHelper.getData(key: 'accessToken'),

    ).then((value){
      print("succesful CreateMedicineWarehouseAddDisSuccessState");


      emit(CreateMedicineWarehouseAddDisSuccessState(value.statusCode));

      print(value.statusCode);

      print("CreateMedicineWarehouseAddDisSuccessState");

    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;
      print("CreateMedicineWarehouseAddDisErrorState");
      print(error.response);
      emit(CreateMedicineWarehouseAddDisErrorState(statusCode));


      print(statusCode);

    });
  }


Future<void> createMedicine1({

required  trade_name_ar,
required trade_name_en,
required description_ar,
required description_en,
required meicine_form_ar,
required meicine_form_en,
required commercial_price,
required net_price,
required size,
required parts,
required img,
required company_id,
required active_mats_active_mat_ar,
required active_mats_active_mat_en,
required active_mats_concentration,
  required active_mats_active_mat_ar1,
  required active_mats_active_mat_en1,
  required active_mats_concentration1,

}) async {
dio.FormData formData = dio.FormData.fromMap(

    { "barcode":"asdad44",
      "trade_name_ar":trade_name_ar,
      "trade_name_en":trade_name_en,
      "description_ar":description_ar,
      "description_en":description_en,
      "medicine_form_ar":meicine_form_ar,
      "medicine_form_en":meicine_form_en,
      "commercial_price":commercial_price,
      "net_price":net_price,
      "size":size,
      "parts":parts,
      "company_id":company_id,
      "active_mats[0][active_mat_ar]":active_mats_active_mat_ar,
      "active_mats[0][active_mat_en]":active_mats_active_mat_en,
      "active_mats[0][concentration]":active_mats_concentration,
      "active_mats[1][active_mat_ar]":active_mats_active_mat_ar1,
      "active_mats[1][active_mat_en]":active_mats_active_mat_en1,
      "active_mats[1][concentration]":active_mats_concentration1,

      "img":await dio.MultipartFile.fromFile(img,filename:'image.jpg'),

    }
);

emit(CreateMedicineWarehouseAddDisLoadingState());
print("CreateMedicineWarehouseAddDisLoadingState");

await DioHelper.postDataPharmacy(

url:"admin/createMedicine",


data: formData, //post=>body=>from_data

token:CacheHelper.getData(key: 'accessToken'),

).then((value){
print("succesful CreateMedicineWarehouseAddDisSuccessState");


emit(CreateMedicineWarehouseAddDisSuccessState(value.statusCode));

print(value.statusCode);

print("CreateMedicineWarehouseAddDisSuccessState");

}).catchError((error){
int statusCode = error.response?.statusCode ?? -1;
print("CreateMedicineWarehouseAddDisErrorState");
print(error.response);
emit(CreateMedicineWarehouseAddDisErrorState(statusCode));


print(statusCode);

});
}




  Future<void> createMedicine2({

    required  trade_name_ar,
    required trade_name_en,
    required description_ar,
    required description_en,
    required meicine_form_ar,
    required meicine_form_en,
    required commercial_price,
    required net_price,
    required size,
    required parts,
    required img,
    required company_id,
    required active_mats_active_mat_ar,
    required active_mats_active_mat_en,
    required active_mats_concentration,
    required active_mats_active_mat_ar1,
    required active_mats_active_mat_en1,
    required active_mats_concentration1,
    required active_mats_active_mat_ar2,
    required active_mats_active_mat_en2,
    required active_mats_concentration2,

  }) async {
    dio.FormData formData = dio.FormData.fromMap(

        { "barcode":"asdad44",
          "trade_name_ar":trade_name_ar,
          "trade_name_en":trade_name_en,
          "description_ar":description_ar,
          "description_en":description_en,
          "medicine_form_ar":meicine_form_ar,
          "medicine_form_en":meicine_form_en,
          "commercial_price":commercial_price,
          "net_price":net_price,
          "size":size,
          "parts":parts,
          "company_id":company_id,
          "active_mats[0][active_mat_ar]":active_mats_active_mat_ar,
          "active_mats[0][active_mat_en]":active_mats_active_mat_en,
          "active_mats[0][concentration]":active_mats_concentration,
          "active_mats[1][active_mat_ar]":active_mats_active_mat_ar1,
          "active_mats[1][active_mat_en]":active_mats_active_mat_en1,
          "active_mats[1][concentration]":active_mats_concentration1,
          "active_mats[2][active_mat_ar]":active_mats_active_mat_ar2,
          "active_mats[2][active_mat_en]":active_mats_active_mat_en2,
          "active_mats[2][concentration]":active_mats_concentration2,

          "img":await dio.MultipartFile.fromFile(img,filename:'image.jpg'),

        }
    );

    emit(CreateMedicineWarehouseAddDisLoadingState());
    print("CreateMedicineWarehouseAddDisLoadingState");

    await DioHelper.postDataPharmacy(

      url:"admin/createMedicine",


      data: formData, //post=>body=>from_data

      token:CacheHelper.getData(key: 'accessToken'),

    ).then((value){
      print("succesful CreateMedicineWarehouseAddDisSuccessState");


      emit(CreateMedicineWarehouseAddDisSuccessState(value.statusCode));

      print(value.statusCode);

      print("CreateMedicineWarehouseAddDisSuccessState");

    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;
      print("CreateMedicineWarehouseAddDisErrorState");
      print(error.response);
      emit(CreateMedicineWarehouseAddDisErrorState(statusCode));


      print(statusCode);

    });
  }
  ////////////////////////////////////////////////////////////////pharmacy in home
 late PharmacyMedicineHome pharmacyMedicineHome;
  Future<void>getAllPharmacyInHome()async{
    emit(GetPharmacyInHomeLoadingState());
    print("GetPharmacyInHomeLoadingState");
    DioHelper.getData(url:"pharmacy/show" ).then((value){
      print(value.data);
      pharmacyMedicineHome=PharmacyMedicineHome.fromJson(value.data);
      print(pharmacyMedicineHome.pharmacies!.length);
      emit(GetPharmacyInHomeSuccessState(value.statusCode));

    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;
     // print(error.response);

      emit(GetPharmacyInHomeErrorState(statusCode));
      print(statusCode);
    });
  }
  //////////////////////////////////////////////////////////////////////medicine
  late PharmacyMedicineHomeOnePage onePage;
  Future<void>getAllMedicineInHome({
  required id
})async{
    emit(GetPharmacyMedicineInHomeLoadingState());
    print("GetPharmacyMedicineInHomeLoadingState");
    DioHelper.getData(url:"pharmacy/existMedicines/$id",query: {
      "search":''
    },token:CacheHelper.getData(key: 'accessToken') ).then((value){
      print(value.data);
      onePage=PharmacyMedicineHomeOnePage.fromJson(value.data);

      emit(GetPharmacyMedicineInHomeSuccessState(value.statusCode));

    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;
      print(error.response);

      emit(GetPharmacyMedicineInHomeErrorState(statusCode));
      print(statusCode);
    });
  }

 //////////////////////////////////////////////////////////////////////////////semilar
  late AlternativesMedicine alternativesMedicine;
  Future<void>getAllMedicineSemailInHome({
    required id
  })async{
    emit(GetPharmacyMedicineSemilarInHomeLoadingState());
    print("GetPharmacyMedicineSemilarInHomeLoadingState");
    DioHelper.getData(url:"pharmacy/getSimilar/$id",token:CacheHelper.getData(key: 'accessToken') ).then((value){
      print(value.data);
      alternativesMedicine=AlternativesMedicine.fromJson(value.data);

      emit(GetPharmacyMedicineSemilarInHomeSuccessState(value.statusCode));
      print("GetPharmacyMedicineSemilarInHomeSuccessState");

    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;
      print(error.response);

      emit(GetPharmacyMedicineSemilarInHomeErrorState(statusCode));
      print(statusCode);
    });
  }

  List<dynamic>SearchMedicinesHome=[];
  Future<void> getSearchHome({
    required  value,
  }) async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر
    emit(GetSearchHomeInHomeLoadingState());
    print("GetSearchHomeInHomeLoadingState");
    //print(value);
    print(CacheHelper.getData(key: 'accessToken'));

    print("respons");

    await  DioHelper.getData(

      url:"medicine/getMedicines",
      query: {
        'search':'$value',
      },
      token:CacheHelper.getData(key: 'accessToken'),


    ).then((value){
      SearchMedicinesHome = value.data['data'];
      print(SearchMedicinesHome);

      emit(GetSearchHomeInHomeSuccessState(value.statusCode));



    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;
      print(error.response.toString());
      emit(GetSearchHomeInHomeErrorState(statusCode));
      print("pp ${error.toString()}");
      print(statusCode);

    });
  }

  late JobwarehousesEmployee jobwarehousesEmployee;
  Future<void>getWarehouseWork()async{
    emit(WarehouseIWorksLoadingState());
    DioHelper.getData(url:"warehouse/jobWarehouses",token:CacheHelper.getData(key: 'accessToken')).
    then((value) {
      jobwarehousesEmployee=JobwarehousesEmployee.fromJson(value.data);
      emit(WarehouseIWorksSuccessState(value.statusCode));


    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;


      emit(WarehouseIWorksErrorState(statusCode));
      print(statusCode);
    });
  }
  late OrderWarehouseWork orderWarehouse;

  Future<void>getOrderWarehouse({
    required id
  })async {
    emit(OrderWarehouseLoadingState());
    print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
    DioHelper.getData(url: "warehouse/orders/${id}", token:CacheHelper.getData(key: 'accessToken'), ).then((value) {
      print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
      print(value.data);
      orderWarehouse=OrderWarehouseWork.fromJson(value.data);
      print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");

      emit(OrderWarehouseSuccessState(value.statusCode));


    }).catchError((error){
      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;

      print(statusCode);
      emit(OrderWarehouseErrorState(statusCode));
      print(statusCode);
    });
  }

  late DetailsWork details;
  Map<dynamic, dynamic>invoiceMedicine={};
  Future<void>postDetails({
    required order_id,
    required warehouse_id,
  })async {

    emit(DetailsLoadingState());
    DioHelper.postData(
      url: "order/showDetails",
      data:{
        "order_id":order_id,
        "warehouse_id":warehouse_id
      },
      token:CacheHelper.getData(key: 'accessToken'), ).then((value) {
      print(value.data);
      details=DetailsWork.fromJson(value.data);

      details.orderDetails!.forEach((element) {
        invoiceMedicine.addAll(
            {
              element.warehouseMedicineId .toString():{
                "quantity":element.warehouseMedicine!.maxQuantity,
                "offer_id":element.offerId,
                "load_id": element.loadId,

              }
            }
        );
      }) ;
      print(invoiceMedicine);

      print(details.orderDetails![0].quantity);
      emit(DetailsWarehouseSuccessState(value.statusCode));


    }).catchError((error){
      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;


      emit(DetailsWarehouseErrorState(statusCode));
      print(statusCode);
    });
  }
//////////////////////////////////////////////////////////////////////////////////////////////////////////
  late GetDispenserWork getDispenser;
  late String? selectedDispensers = getDispenser.dispensers![0].user!.name; // تعريف متغير لتخزين اسم الدواء المختار
  late int? selectedDispensersId = getDispenser.dispensers![0].id; // تعريف متغير لتخزين id الدواء المختار

  List<DropdownMenuItem<String>> dispensersDropDownItems = []; // تعريف قائمة الادوية

  void getDDropDownItems() {
    dispensersDropDownItems = getDispenser.dispensers!.map((day) {
      return DropdownMenuItem<String>(
        value: day.user!.name,
        child: Text("${day.user!.name}",style: TextStyle(color: HexColor("6C6D72"),
            fontSize: 14)),
      );
    }).toList();

  }
  changeSelectedDispensers(String days) {
    getDDropDownItems();
    selectedDispensers = days;
    selectedDispensersId = getDispenser.dispensers!.firstWhere((day) => day.user!.name== days).id;
    return  selectedDispensers;
  }


  Future<void>getDis(

      )async {
    print("getDis");
    DioHelper.getData(url: "warehouse/getDispensers/${CacheHelper.getData(key: "idWEmployee")}",
      token:CacheHelper.getData(key: 'accessToken'), ).then((value) {
      print("getDis");

      print(value.data);

      getDispenser=GetDispenserWork.fromJson(value.data);


    }).catchError((error){
      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;
      print(error.response);

      print(statusCode);
    });
  }



  Future<void>postCreateInvoice({
    required date_of_invoice,
    required order_id,

  })async {

    emit(InvoiceLoadingState());
    DioHelper.postData(
      url: "order/createInvoice",
      data:{
        "date_of_invoice":date_of_invoice,
        "order_id":order_id,
        "warehouseDispenser_id":selectedDispensersId,
        "invoice_medicines":invoiceMedicine,
      },
      token:CacheHelper.getData(key: 'accessToken'), ).then((value) {


      emit(InvoiceWarehouseSuccessState(value.statusCode));


    }).catchError((error){
      print("error.response.toString()");
      print(selectedDispensersId);
      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;


      emit(InvoiceWarehouseErrorState(statusCode));
      print(statusCode);
    });
  }

  String Qrcode ="" ;

  Future<void> getQRCode () async {

    emit(generatePharmacy_QR_CubitLoadingState());
    print("UserLoadingLoginWithGoogleState");

    print("respons");

    await DioHelper.postData(

      url:"pharmacy/generateQr",


      data: {
        'pharmacy_id':CacheHelper.getData(key: 'idPharmacy'),
      } //post=>body=>from_data
      ,
      token:CacheHelper.getData(key: 'accessToken'),

    ).then((value){
      print("succesful");

      Qrcode = value.data.toString() ;
      print( "Super Important ${Qrcode.toString()}");
      emit(generatePharmacy_QR_CubitSuccessState(value.statusCode));

      print(value.statusCode);
      // print(value.data);
      print("generatePharmacy_QR_CubitSuccessState");

    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(generatePharmacy_QR_CubitErrorState(error.toString()));
      print(error);
      print(statusCode);

    });
  }
}
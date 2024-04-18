import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/AreasModel/areas_model.dart';
import 'package:pharmacy/Model/Login_Model.dart';
import 'package:pharmacy/Model/Register_pharmacy.dart';
import 'package:pharmacy/Model/UserModel.dart';
import 'package:pharmacy/login/states.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';
import 'package:pharmacy/shared/network/remote/dio_helper.dart';

class PharmacyLoginCubit extends Cubit<PharmacyLoginStates>{
  PharmacyLoginCubit():super(PharmacyInitialState());
  static PharmacyLoginCubit get(context) => BlocProvider.of(context);

  IconData suffix=Icons.visibility_outlined;
  bool isPasswordShown=true;
  void changePasswordVisibility(){
    isPasswordShown=!isPasswordShown;
    suffix=isPasswordShown?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ChangePassWordVisibilityState ());
  }
  late LoginModel loginModel;

  Future<void> login({
    required String email,
    required String password,

  }) async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر
    emit(PharmacyLoadingState());
    print("UserLoadingState");
    FormData formData = FormData.fromMap({

      'username':email,
      'password':password,
      'grant_type':"password",
      'client_id':2,
      'client_secret':"Vq3ibEGoOR4Nwl2O2Euge5Sxn56xh6ycZeqWxl9R",
      'scope':'',
    });
    print("respons");

    DioHelper.postData(

        url:"user/login",


        data: {
          'username':email,
          'password':password,
          'grant_type':"password",
          'client_id':2,
          'client_secret':"Vq3ibEGoOR4Nwl2O2Euge5Sxn56xh6ycZeqWxl9R",
          'scope':'',} //post=>body=>from_data

    ).then((value){
      print("data");

      loginModel= LoginModel.fromJson(value.data);
      emit(PharmacySuccessState(loginModel,value.statusCode));
      print("UserSuccessState");


    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(PharmacyErrorState(statusCode));
      print(error);
      print(statusCode);

    });
  }
   List<dynamic> areasModel=[];
  Future<void>areas()async{

    DioHelper.getData(url:"places" ).then((value){
      print(value.data);

      print(value.data);
     }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

    });
  }
  late UserModel userModel;
  void getUser(){
    emit(UserLoadingDataState());

    DioHelper.postDataUser(url:'user'
      ,token:CacheHelper.getData(key: 'accessToken'),
    ).then((value){
      print(" succ");
      userModel=UserModel.fromJson(value.data);
      print(value.data);
      print(userModel.adminLevel);
      print(CacheHelper.getData(
          key: 'adminLevel'));

      CacheHelper.saveData(
          key: 'adminLevel', value:userModel.adminLevel);
      CacheHelper.saveData(
          key: 'name', value:userModel.name);
      CacheHelper.saveData(
          key: 'email', value:userModel.email);
      CacheHelper.saveData(
          key: 'idsanarawan', value:userModel.id);
      emit(UserSuccessDataState(value.statusCode,userModel));
    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(UserErrorDataState(statusCode));
      print(error);
      print(statusCode);
    });
  }
  late ModelPharmacy modelPharmacy;

  Future<void>getPharmacyAndWarehouse()async {

    emit(PharmacyWLoadingState());
    print("PharmacyWLoadingState:");
    DioHelper.getData(
      url: "user/get", token:CacheHelper.getData(key: 'accessToken'), ).then((value) {
      modelPharmacy=ModelPharmacy.fromJson(value.data);
      emit(PharmacyWSuccessState(value.statusCode,modelPharmacy));
      print(value.data);
    }).catchError((error){
      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;


      emit(PharmacyWErrorState(statusCode));
      print(statusCode);
    });
  }
}
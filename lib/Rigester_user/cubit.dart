
//user
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Model/RigesterUser_Model.dart';
import 'package:pharmacy/Model/UserModel.dart';
import 'package:pharmacy/Rigester_user/states.dart';
import 'package:pharmacy/shared/network/end_points.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';
import 'package:pharmacy/shared/network/remote/dio_helper.dart';

class UserRegisterCubit extends Cubit<UserRegisterStates> {
  UserRegisterCubit() : super(UserInitialState());

  static UserRegisterCubit get(context) => BlocProvider.of(context);
   String?r="register";
  String? selectedItemGender = "44".tr;


  IconData suffix=Icons.visibility_outlined;
  bool isPasswordShown=true;
  void changePasswordVisibility(){
    isPasswordShown=!isPasswordShown;
    suffix=isPasswordShown?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ChangePassWordVisibilityState ());
  }

  void changeDropDownGender(item){
  selectedItemGender = item;
      emit(UserChangeDropGenderState());
  }

  late RegisterUser registerUser;

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String userName,
    required  phoneNumber,
    required area_id,
    required  age,
    required   code,
  }){//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر
    emit(UserLoadingState());
    print("UserLoadingState");

    DioHelper.postData(

        url:"user/register",
        data: {
          'age':age,
          'name':name,
          'email':email,
          'password':password,
          'code':code,
          'username':userName,
          'grant_type':"password",
          'client_id':2,
          'client_secret':"Vq3ibEGoOR4Nwl2O2Euge5Sxn56xh6ycZeqWxl9R",
          'scope':'',
           'gender':selectedItemGender=="Male"?"m":"f",
          'phoneNumber':phoneNumber,
          'area_id':selectedAllCityId,
          'location_desc':area_id
        } //post=>body=>from_data
          ).then((value){
      print("data");
//"Male",
//       "45": "Female",
      registerUser= RegisterUser.fromJson(value.data);
      emit(UserSuccessState(registerUser,value.statusCode));
      print("UserSuccessState");

    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;
      print(error.response.toString());
      emit(UserErrorState(statusCode));

      print(statusCode);

    });
  }
void sendEmail({
  required String email,
  required String type,

}){
    emit(UserLoadingSendEmailState());

DioHelper.postData(url:'user/sendMeEmail',data: {'email': email,
  'type': type,}).then((value){
  print("send email succ");
print(value.data);
  emit(UserSuccessSendEmailState(value.statusCode));
}).catchError((error){
  int statusCode = error.response?.statusCode ?? -1;

  emit(UserErrorSendEmailState(statusCode));
  print(error);
  print(statusCode);
});






}
  void sendEmailForget({
    required String email,
    required String type,

  }){
    emit(UserLoadingSendEmailForgetState());

    DioHelper.postData(url:'user/sendMeEmail',data: {'email': email,
      'type': type,}).then((value){
      print("send email succ");

      emit(UserSuccessSendEmailForgetState(value.statusCode));
    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(UserErrorSendEmailForgetState(statusCode));

      print(statusCode);
    });

  }

  void checkCode({
    required String email,
    required int code,

  }){
    emit(UserLoadingCheckForgetState());

    DioHelper.postData(url:'user/checkCode',data: { 'email': email,
      'code': code,}).then((value){
      print("send user/checkCode succ");

      emit(UserSuccessCheckForgetState(value.statusCode));
    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(UserErrorCheckForgetState(statusCode));


    });

  }
  void patchForgotPassword({
    required String confirmPassword,
    required String  password,
    required String email,
    required int code,

  }){
    emit(UserLoadingPatchForgetState());


    DioHelper.patchData(url:'user/forgotPass',data: { 'password':password,
      'confirmPassword':confirmPassword,
      'email':email,
      'code':code,}).then((value){


      emit(UserSuccessPatchForgetState(value.statusCode));
    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(UserErrorPatchForgetState(statusCode));

   print(statusCode);
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
      print(userModel.adminLevel);
      print(value.data);
      print(CacheHelper.getData(
          key: 'adminLevel'));
      CacheHelper.saveData(
          key: 'adminLevel', value:userModel.adminLevel);
      CacheHelper.saveData(
          key: 'name', value:userModel.name);
      CacheHelper.saveData(
          key: 'email', value:userModel.email);
      CacheHelper.saveData(
          key: 'number', value:userModel.phoneNumber);
      emit(UserSuccessDataState(value.statusCode,userModel));
    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(UserErrorDataState(statusCode));
      print(error);
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
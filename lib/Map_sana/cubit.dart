import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/Map_sana/state.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';
import 'package:pharmacy/shared/network/remote/dio_helper.dart';

//Pharmacy
class MapCubit extends Cubit<MapStates> {
  MapCubit() : super(MapInitialState());

  static MapCubit get(context) => BlocProvider.of(context);

  List<dynamic> SearchMedicines =[];


  Future<void> getSearch({
    required String value,

  }) async {//هل لح اكتبن بايدي طبعا لا لح اخدن من اليوزر
    emit(MapSearchLoadingState());
    print("UserLoadingState");
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
    SearchMedicines = value.data['data'];
      print(SearchMedicines);

      emit(MapSearchSuccessState());


    }).catchError((error){
    //  int statusCode = error.response?.statusCode ?? -1;

     emit(MapSearchErrorState(error));
   //  print("pp ${error.toString()}");
   //   print(statusCode);

    });
  }

   dynamic nearby ={} ;

  Future<void> getnearby({
    required String lat,
    required String lon,
    required String medicinid,

  }) async {
    emit(MapNearbyLoadingState());
    print("UserLoadingLoginWithGoogleState");
    FormData formData = FormData.fromMap({

      'start':"$lat,$lon",
      'medicine_id':medicinid

    });
    print("respons");

    await DioHelper.postData(

        url:"pharmacy/closest",


        data: {
          'start':"$lat,$lon",
          'medicine_id':medicinid
        } //post=>body=>from_data
      ,
      token:CacheHelper.getData(key: 'accessToken'),

    ).then((value){
      print("succesful");

      nearby = value.data ;
      print(nearby.toString());
      emit(MapNearbySuccessState());

      print(value.statusCode);
     // print(value.data);
      print("UserSuccessLoginWithGoogleState");

    }).catchError((error){
      //int statusCode = error.response?.statusCode ?? -1;

      emit(MapNearbyErrorState(error.toString()));
      print(error);
     // print(statusCode);

    });
  }






}

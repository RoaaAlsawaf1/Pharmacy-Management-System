import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/Model/Chats_Model.dart';
import 'package:pharmacy/chats/states.dart';
import 'package:pharmacy/Map_sana/state.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';
import 'package:pharmacy/shared/network/remote/dio_helper.dart';
import 'package:http/http.dart' as http;

//Pharmacy
class ChatsCubit extends Cubit<ChatsStates> {
  ChatsCubit() : super(ChatsInitialState());

  static ChatsCubit get(context) => BlocProvider.of(context);

  List<Message> Chatmessages =[];


  Future<List<Message>> getChats(String otherId ) async {//userid

    var response = await http.get(Uri.parse("http://192.168.43.142:8000/api/messages/of/${
    CacheHelper.getData(key: "idsanarawan")
    }/with/${otherId}"),
      headers: {
        'Accept' : 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'accessToken')}'
      },
    );

    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
     // emit(GetChatsSuccessState());
      var replay = chatmodelFromJson(response.body);

      return replay.messages  ;
    }
    else{
      return [];
    }
  }

  Future<void> amethod( String otherId) async {
    emit(GetChatsLoadingState());
    Chatmessages = await ChatsCubit().getChats(otherId) ;
    emit(GetChatsSuccessState());
  }


  // Future<void> getChatmessages({
  //   required String otherId,
  //
  // }) async {
  //   emit(GetChatsLoadingState());
  //   print("GetChatsLoadingState");
  //   //print(value);
  //   print(CacheHelper.getData(key: 'accessToken'));
  //
  //   print("respons");
  //   print(otherId);
  //
  //   await  DioHelper.getData2(
  //
  //     url:"messages/of/1/with/${otherId}",
  //
  //     token:CacheHelper.getData(key: 'accessToken'),
  //
  //
  //   ).then((value){
  //     Chatmessages =  value.data['messages'] ;
  //
  //     print(Chatmessages);
  //     emit(GetChatsSuccessState());
  //
  //
  //   }).catchError((error){
  //
  //
  //     emit(GetChatsErrorState(error));
  //     print("pp ${error.toString()}");
  //
  //
  //   });
  // }



  Future<void> sendmessage({
    required String otherId,
    required String body,//

  }) async {
    emit(SendChatsLoadingState());
    print("SendChatsLoadingState");
    FormData formData = FormData.fromMap({

      'body':body,

    });
    print("respons");

    await DioHelper.postData(
       //userid
      url:"send/from/${CacheHelper.getData(key: "idsanarawan")}/to/${otherId}",


      data: {
        'body':body,
      } //post=>body=>from_data
      ,
      token:CacheHelper.getData(key: 'accessToken'),

    ).then((value){
      print("succesful");


      emit(SendChatsSuccessState());
      print(value.data);
      print(value.statusCode);

      // print(value.data);
      print("SendChatsSuccessState");

    }).catchError((error){

      emit(SendChatsErrorState(error.toString()));
      print(error);


    });
  }



List<dynamic> contacts =[];

  Future<void> getcontacts() async {

    emit(contactsLoadingState());
    print("contactsLoadingState");
    //print(value);
    print(CacheHelper.getData(key: 'accessToken'));

    print("respons");


    await  DioHelper.getData2(
              //userid
      url:"contacts/of/${CacheHelper.getData(key: "idsanarawan")}",

      token:CacheHelper.getData(key: 'accessToken'),


    ).then((value){
      contacts =  value.data['contacts'];

      print(contacts);
      emit(contactsSuccessState());


    }).catchError((error){


      emit(contactsErrorState(error));
      print("pp ${error.toString()}");


    });
  }


}

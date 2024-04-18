

import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import 'package:flutter_pusher_client/flutter_pusher.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:pharmacy/Model/Chats_Model.dart';
import 'package:pharmacy/chats/cubit.dart';
import 'package:pharmacy/chats/states.dart';

import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';

//import 'package:laravel_echo/laravel_echo.dart';

class Chat_screen extends StatefulWidget{
  String otherId;
  String othername;
  Chat_screen ({
    required   this.otherId,
    required this.othername
  });

  @override
  State<Chat_screen> createState() {
    return _Chat_screen(otherId: otherId , othername: othername);
  }
}


class _Chat_screen extends State<Chat_screen> {
  String otherId;
  String othername;
  _Chat_screen ({
    required   this.otherId,
    required this.othername
  });

  final fieldText = TextEditingController();




  @override
  void initState() {
    ChatsCubit.get(context).amethod(otherId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatsCubit, ChatsStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          List<Message> Chatslist = ChatsCubit.get(context).Chatmessages;


          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 130,
              titleSpacing: 0.0,
              leadingWidth: double.infinity,
              elevation: 0.0,
              backgroundColor: Colors.white,
              leading:

              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(onPressed: () {

                    },
                        icon: Icon(
                          Icons.arrow_back_rounded, color: Colors.black,
                          size: 25,)),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(othername,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                color: Colors.grey.shade800
                            ),
                          ), //
                          SizedBox(height: 10,),


                          Text("Store",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade600
                            ),
                          ),

                        ],
                      ),
                    ), // location


                  ]),


            ),

            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration:
              BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/screen.jpg'), fit: BoxFit.cover),
              ),


              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(color: Colors.transparent,
                    child: Column(children: [
                      Expanded(child:
                       ConditionalBuilder(
                        condition: state is !GetChatsLoadingState ,
                         builder: (context) =>  GroupedListView<Message, DateTime>(
                          elements: Chatslist,
                          groupBy: (message) =>
                              DateTime(
                                  message.createdAt.year,
                                  message.createdAt.month,
                                  message.createdAt.day
                              ),
                          reverse: true,
                          order: GroupedListOrder.DESC,
                          useStickyGroupSeparators: true,
                          floatingHeader: true,
                          groupHeaderBuilder: (Message message) =>
                              SizedBox(
                                  height: 40,
                                  child:
                                  Center(
                                    child: Card(
                                      color: Colors.grey.shade500,
                                      child: Padding(
                                          padding: EdgeInsets.all(8),


                                          child: Text(
                                            DateFormat.yMMMd().format(
                                                message.createdAt)
                                            ,
                                            style: TextStyle(
                                                color: Colors.white
                                            ),
                                          )

                                      ),
                                    ),
                                  )

                              ),
                          padding: EdgeInsets.all(8),
                          itemBuilder: (context, Message message) =>
                              Align(
                                alignment: message.from == 1 ?
                                Alignment.centerRight
                                    : Alignment.centerLeft,
                                child:
                                Stack(
                                    children: [
                                      Card(
                                        color: message.from == 1 ?
                                        HexColor(green.toString())
                                            : Colors.white.withAlpha(100),
                                        elevation: 8,
                                        child: Padding(
                                          padding: EdgeInsets.all(12),
                                          child: Column(
                                            children: [
                                              Text(message.body
                                                , style: TextStyle(
                                                  color: message.from == 1?
                                                  Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: 10,),


                                            ],
                                          ),
                                        ),
                                      ),
                                      message.from == 1 ?
                                      Positioned(
                                        right: 6,
                                        bottom: 5,
                                        child: Text("${message.createdAt.hour}:${message.createdAt.minute}",//
                                          style: TextStyle(
                                              fontSize: 10
                                              , color:
                                          Colors.green.shade100

                                          ),
                                        ),
                                      )
                                          : Positioned(
                                        left: 6,
                                        bottom: 5,
                                        child: Text("${message.createdAt.hour}:${message.createdAt.minute}",//,
                                          style: TextStyle(
                                            fontSize: 10
                                            , color:
                                          Colors.grey.shade600,
                                          ),
                                        ),
                                      )
                                    ]
                                )
                                ,
                              )

                      ),

                      fallback: (context) =>
                      const Center(child: CircularProgressIndicator()),
                    )


                      ),


                      Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          color: Colors.white,
                          child:
                          Row(
                            children: [
                              Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * .85,
                                  child:
                                  TextField(
                                    controller: fieldText,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(12),
                                        hintText: 'Type your message '
                                    ),
                                    onSubmitted: (text) {

                                    },
                                  )),
                              IconButton(onPressed: () {

                                setState(() {
                                  Chatslist.add(Message(id: Chatslist.length+1, from: 1, to: 2, body: fieldText.text, createdAt: DateTime.now(), updatedAt: DateTime.now()));
                                });
                                ChatsCubit.get(context).sendmessage(otherId: otherId, body: fieldText.text);
                                clearText();
                              },
                                  icon: Icon(Icons.send,
                                    color: HexColor(green.toString()),))
                            ],
                          )

                      )


                    ],),
                  )
              ),
            ),


          );
        }

    );
  }

  void clearText() {
    fieldText.clear();
  }
}
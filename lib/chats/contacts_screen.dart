

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/chats/chat_screen.dart';
import 'package:pharmacy/chats/cubit.dart';
import 'package:pharmacy/chats/states.dart';

import 'package:pharmacy/shared/components/components.dart';


class Contacts_Screen extends StatefulWidget{
  @override
  State<Contacts_Screen> createState() {
    return _Contacts_Screen();
  }

}

class _Contacts_Screen extends State<Contacts_Screen> {

  @override
  void initState() {
    ChatsCubit.get(context).getcontacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatsCubit, ChatsStates>(
      listener:(context,state) {
       // if(state is GetChatsSuccessState){
       //
       //      navigateTo(context: context, widget: Chat_screen());
       //
       //  }
       //  if(state is MapNearbyErrorState){
       //    showToast(text:"There is no nearby pharmacy ." ,state: ToastStates.EROOR);
       //  }

      },
      builder:(context,state)  {
        var contactslist = ChatsCubit.get(context).contacts;



        return  Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            titleSpacing: 0.0,
            leadingWidth: 46,
            elevation: 0.0,
            flexibleSpace: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    HexColor('A8BEE7'),
                    HexColor('AEC9DE'), //gray light
                    //gray dark
                    HexColor('BBC5CE'),
                  ],
                  tileMode: TileMode.clamp,
                ),
              ),
            ),

          ),

          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient:LinearGradient(

                begin:  Alignment.topRight,
                end:Alignment.bottomLeft ,

                colors: [
                  HexColor('A8BEE7'),
                  HexColor('AEC9DE'),//gray light
                  //gray dark
                  HexColor('BBC5CE'),
                  HexColor('BDB9C7'),//
                  HexColor('D3C8CC'),
                  HexColor('D3CACF'),
                  HexColor('DBD9DE'),
                  HexColor('D7D2D8'),

                ],
                tileMode: TileMode.clamp,

              ),

            ),

            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [

                  //Text
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child:
                      ConditionalBuilder(
                        condition: state is !contactsLoadingState ,
                        builder: (context) =>
                            Container(
                              height: MediaQuery.of(context).size.height*0.7,
                              width: double.infinity,
                              child: ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder:(context, index) {
                                    return
                                      InkWell(

                                        onTap: () {

                                          navigateTo(context: context, widget: Chat_screen( otherId :contactslist[index]['id'].toString(),othername: contactslist[index]['name'].toString(), ));



                                        },
                                        child: Container(
                                          width: 220,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            color:HexColor("E5E4E2"),
                                          ),
                                          child:
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment:  CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(width: 30),
                                              Icon(Icons.person)
                                              ,
                                              SizedBox(width: 10),

                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment:  CrossAxisAlignment.start,
                                                children: [

                                                  Text("${contactslist[index]['name']} "
                                                    ,style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold
                                                    ),),
                                                  SizedBox(height: 5,),

                                                ],
                                              )
                                            ],
                                          ),

                                        ),
                                      );


                                  },
                                  separatorBuilder: (context, index) => SizedBox(height: 12),
                                  itemCount: contactslist.length
                              ),
                            ),
                        fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                      )
                  ),//pharmacy




                ],
              ),


            ),
          ),

        );

      },
    );



  }



}

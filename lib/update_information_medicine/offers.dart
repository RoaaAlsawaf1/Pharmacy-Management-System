import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';
import 'package:pharmacy/update_information_medicine/update.dart';

class Offers extends StatelessWidget {
   Offers({Key? key}) : super(key: key);
  var data=Get.arguments;
  @override
  Widget build(BuildContext context) {

    return   BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(

      listener: (context, state) {
        if(state is DeleteOffersSuccessState){
          if(state.value==200){
            showToast(text: "Delete Successfully", state: ToastStates.EROOR);
            PharmacyHomeCubit.get(context).getOffers(id:                                            CacheHelper.getData(key: "searchlistid")
            );


          }
        }
        if(state is DeleteOffersErrorState){
          if(state.error==401){
            showToast(text: "The selected offer id is invalid", state: ToastStates.EROOR);


          }
        }
      },
      builder: (context, state) {
       var offerss= PharmacyHomeCubit.get(context).offerss;
        return Scaffold(
          // appBar: AppBar(
          //   toolbarHeight: 80,
          //   titleSpacing: 0.0,
          //   leadingWidth: 46,
          //   elevation: 0.0,
          //   flexibleSpace: Container(
          //     height: double.infinity,
          //     width: double.infinity,
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topRight,
          //         end: Alignment.bottomLeft,
          //         colors: [
          //           HexColor('A8BEE7'),
          //           HexColor('AEC9DE'), //gray light
          //           //gray dark
          //           HexColor('BBC5CE'),
          //         ],
          //         tileMode: TileMode.clamp,
          //       ),
          //     ),
          //   ),
          //   leading:Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: IconButton(onPressed: () {
          //       Navigator.pop(context);
          //     }, icon:Icon(Icons.arrow_back,)),
          //   ),
          //   title: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Text("Offers" ),
          //   ),
          //
          //
          // ),
          extendBodyBehindAppBar: true,
          appBar:   AppBar(
            toolbarHeight: 80,
            titleSpacing: 0.0,
            leadingWidth: 70,
            elevation: 0.0,

            flexibleSpace: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                child: Container(color: Colors.transparent,),
              ),
            ),

            backgroundColor:Colors.white.withAlpha(100) ,

            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child:  Text("Offers",
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16, color: Colors.grey.shade800,
                  )),
            ),
            leading:Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: () {
                navigateAndFinish(context: context,widget: Update());
                PharmacyHomeCubit.get(context).getSearch(value:'',id:       CacheHelper.getData(key: "idW"));

              }, icon: Icon(Icons.arrow_back_ios_new_outlined,color:HexColor(green),)),
            ),

          ),
          body:  Container(

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
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0,left:20,right: 20 ),
                child: Container(
                  height: 100000,
                  child: ConditionalBuilder(
                    condition:state is!DeleteOffersLoadingState ,
                    builder:(context) => ListView.separated(

                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [

                              Container(

                                height: MediaQuery.of(context).size.height*0.2,
                                width: double.infinity,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color:Colors.white.withOpacity(0.2),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Expanded(

                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text("Demand Quantity : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                                           Spacer(),
                                            Text("${offerss[index]['demand_quantity']}"
                                                ,style: TextStyle(fontSize: 16)),
                                          ],
                                        ),
                                        SizedBox(height: 20,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text("Free Quantity : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                                            Spacer(),
                                            Text("${offerss[index]['free_quantity']}"
                                                ,style: TextStyle(fontSize: 16)),
                                          ],
                                        ),




                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  PharmacyHomeCubit.get(context).deleteOffers(offer_id:offerss[index]['id']);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:HexColor(green.toString()),

                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(16),
                                        topLeft: Radius.circular(16)
                                    ),
                                  ),
                                  height: 30,
                                  width: 150,
                                  child: Center(child: Text("Delete the offer",style: TextStyle(color: Colors.white,fontSize: 12),)),

                                ),
                              ),
                            ],

                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemCount: offerss.length) ,
                    fallback: (context) => Center(child: CircularProgressIndicator(color: HexColor(green.toString()),)),

                  ),
                ),
              ),
            ),
          ),

        );
      },

    );
  }
  Widget buildMedicine(context,v) =>  Stack(
    alignment: AlignmentDirectional.bottomEnd,
    children: [

      Container(

        height: MediaQuery.of(context).size.height*0.2,
        width: double.infinity,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color:Colors.white.withOpacity(0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Expanded(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Demand Quantity : ",style: TextStyle(fontSize: 16)),

                    Text("${v['demand_quantity']}"
                        ,style: TextStyle(fontSize: 12)),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Free Quantity : ",style: TextStyle(fontSize: 16)),

                    Text("${v['free_quantity']}"
                        ,style: TextStyle(fontSize: 12)),
                  ],
                ),




              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          PharmacyHomeCubit.get(context).deleteOffers(offer_id:v['id']);
        },
        child: Container(
          decoration: BoxDecoration(
            color:HexColor(green.toString()),

            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                topLeft: Radius.circular(16)
            ),
          ),
          height: 30,
          width: 150,
          child: Center(child: Text("Delete the offer",style: TextStyle(color: Colors.white,fontSize: 12),)),

        ),
      ),
    ],

  );
}

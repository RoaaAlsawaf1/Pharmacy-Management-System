import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/dashboard/size_config.dart';
import 'package:pharmacy/dashboard/style.dart';
import 'package:pharmacy/make_order/Model.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';
import 'package:pharmacy/update_information_medicine/Load.dart';
import 'package:pharmacy/update_information_medicine/Medicine_WareHouse.dart';
import 'package:pharmacy/update_information_medicine/Search.dart';
import 'package:pharmacy/update_information_medicine/offers.dart';

class Update extends StatefulWidget {
   Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
   var maxController=TextEditingController();

   var priceController=TextEditingController();

   var offersNumber=TextEditingController();

   var quantityAddOffers=TextEditingController();

   var freeAddOffers=TextEditingController();

   var numberMedicine=TextEditingController();

   var quantityAddLoads=TextEditingController();

   var data=Get.arguments;

   Map<String,Map<String,String>>map={};

   @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
    listener:(context, state) {
      if(state is UpdateSuccessState){
        if(state.value==200){
          showToast(text: "Update Successfully", state: ToastStates.EROOR);
          priceController.clear();
          maxController.clear();
        }
      }
      if(state is UpdateErrorState){

          showToast(text: "error", state: ToastStates.EROOR);


      }
      if(state is AddOffersSuccessState){
        if(state.value==200){
          showToast(text: "Add Successfully", state: ToastStates.EROOR);
          quantityAddOffers.clear();
          freeAddOffers.clear();
          PharmacyHomeCubit.get(context).getOffers(id:    CacheHelper.getData(key: "searchlistid")
          );
        }
      }
      if(state is AddOffersErrorState){

        showToast(text: "error", state: ToastStates.EROOR);


      }

      if(state is AddLoadsSuccessState){
        if(state.value==200){
          showToast(text: "add Successfully", state: ToastStates.EROOR);
          quantityAddLoads.clear();
          PharmacyHomeCubit.get(context).getLoads(id:data[0]);

        }
      }
      if(state is AddLoadsErrorState){
        if(state.error==401){
          showToast(text: "The selected offer id is invalid", state: ToastStates.EROOR);


        }
      }

    },
      builder:(context, state) {
        PharmacyHomeCubit.get(context).getMedicinesDropDownItems();
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
          //     Navigator.pop(context);
          //     }, icon:Icon(Icons.arrow_back,)),
          //   ),
          //   title: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Text("update" ),
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
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child:  Text("My Warehouse",
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16, color: Colors.grey.shade800,
                  )),
            ),
            leading:Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: () {
                navigateAndFinish(context: context,widget: Search());
                PharmacyHomeCubit.get(context).getSearch(value:'',id:       CacheHelper.getData(key: "idW"));

              }, icon: Icon(Icons.arrow_back_ios_new_outlined,color:HexColor(green),)),
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
            child:SingleChildScrollView(
physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left:  16.0,right: 16,top: 140),
                child:Container(
                  height: 10000,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Max_quantity :",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                      SizedBox(height: 30,),
                      Row(

                        children: [

                          Expanded(

                            flex:4,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(35),bottomLeft:Radius.circular(35)),
                                color: Colors.white.withOpacity(0.3),),
                              child:defaultTextFieldPharmacyDashboard(
                                controller: maxController, type: TextInputType.text,
                                validate: (value){

                                },
                                prefix: Icons.production_quantity_limits,
                                hint:"quantity",




                              ),
                            ),
                          ),

                          Expanded(
                            flex:1,
                            child: Container(

                              decoration: BoxDecoration(
                                color:HexColor(green.toString()),

                                borderRadius: BorderRadius.only(topRight: Radius.circular(35),bottomRight:Radius.circular(35)),
                                gradient:LinearGradient(

                                  begin:  Alignment.topCenter,
                                  end:Alignment.bottomCenter ,

                                  colors: [
                                    HexColor('56949a'),
                                    HexColor('3e8489'),

                                  ],


                                ),
                              ),
                              child: MaterialButton(
                                  splashColor: HexColor(green.toString()),


                                  onPressed: () {

                              PharmacyHomeCubit.get(context).updateMedicineWarehouse(

                                  warehouseMedicine_id:CacheHelper.getData(key: "searchlistid")
                                  ,
                                  max_quantity:maxController.text,
                                );

                                  },
                                  child: Text("update",style: TextStyle(color:Colors.white, fontSize: 12))
                              ),
                            ),
                          ),
                        ],

                      ),
                      SizedBox(height: 30,),

                      ConditionalBuilder(
                        builder: (context) => MyLine(),
                          fallback: (context) => LinearProgressIndicator(color:
                          HexColor(green.toString()),minHeight:2,),
                          condition: state is! UpdateLoadingState ,


                      ),
                      SizedBox(height: 30,),
                      Text(" Offers :",style: TextStyle(fontSize: 16,  fontWeight: FontWeight.w400),),
                       SizedBox(height: 30,),
                      // Row(
                      //
                      //   children: [
                      //     Expanded(
                      //
                      //       flex:4,
                      //       child: Container(
                      //
                      //         child:defaultTextFieldPharmacyDashboard(
                      //           controller: offersNumber, type: TextInputType.number,
                      //           validate: (value){
                      //
                      //           },
                      //           prefix: Icons.numbers,
                      //           hint:"offers number",
                      //
                      //
                      //
                      //
                      //         ),
                      //       ),
                      //     ),
                      //
                      //
                      //     Expanded(
                      //       flex:1,
                      //       child: Container(
                      //
                      //         decoration: BoxDecoration(
                      //           color:HexColor(green.toString()),
                      //
                      //           borderRadius: BorderRadius.only(topRight: Radius.circular(35),bottomRight:Radius.circular(35)),
                      //           gradient:LinearGradient(
                      //
                      //             begin:  Alignment.topCenter,
                      //             end:Alignment.bottomCenter ,
                      //
                      //             colors: [
                      //               HexColor('56949a'),
                      //               HexColor('3e8489'),
                      //
                      //             ],
                      //
                      //
                      //           ),
                      //         ),
                      //         child: MaterialButton(
                      //             splashColor: HexColor(green.toString()),
                      //
                      //
                      //             onPressed: () {
                      //          PharmacyHomeCubit.get(context).deleteOffers(offer_id:offersNumber.text);
                      //             },
                      //             child: Text("delete",style: TextStyle(color:Colors.white,fontSize: 12))
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      //
                      // ),
                      SizedBox(height: 20,),
                      Row(children: [
                        Text("   demand_quantity",style: TextStyle(fontSize: 12, color: Colors.grey),),
                        SizedBox(width: 20,),
                        Text("free_quantity",style: TextStyle(fontSize: 12,  color: Colors.grey),),
                      ],

                      ),
                      SizedBox(height: 20,),
                      Row(

                        children: [
                          Expanded(

                            flex:2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(35),bottomLeft:Radius.circular(35)),
                                color: Colors.white.withOpacity(0.3),),
                              child:defaultTextFieldPharmacyDashboard(
                                controller: quantityAddOffers, type: TextInputType.text,
                                validate: (value){

                                },
                                prefix: Icons.production_quantity_limits,
                                hint:"quantity",




                              ),
                            ),
                          ),
                          Expanded(

                            flex:2,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),),
                              child:defaultTextFieldPharmacyDashboard1(
                                controller: freeAddOffers, type: TextInputType.text,
                                validate: (value){

                                },
                                hint:"free",




                              ),
                            ),
                          ),

                          Expanded(
                            flex:1,
                            child: Container(

                              decoration: BoxDecoration(
                                color:HexColor(green.toString()),

                                borderRadius: BorderRadius.only(topRight: Radius.circular(35),bottomRight:Radius.circular(35)),
                                gradient:LinearGradient(

                                  begin:  Alignment.topCenter,
                                  end:Alignment.bottomCenter ,

                                  colors: [
                                    HexColor('56949a'),
                                    HexColor('3e8489'),

                                  ],


                                ),
                              ),
                              child: MaterialButton(
                                  splashColor: HexColor(green.toString()),


                                  onPressed: () {
                        PharmacyHomeCubit.get(context).offerAddMedicineWarehouse(
                            warehouseMedicine_id:  CacheHelper.getData(key: "searchlistid"),
                            demand_quantity: quantityAddOffers.text,
                            free_quantity: freeAddOffers.text);

                                  },
                                  child: Text("add",style: TextStyle(color:Colors.white,fontSize: 12),)
                              ),
                            ),
                          ),
                        ],

                      ),
                      SizedBox(height: 20,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: (){

                           Get.to(() =>Offers(), arguments: [

                             CacheHelper.getData(key: "searchlistid")


                             // searchlist[index]['offer'][index]['id']
                           ]);
                          }, child:Text("Go for delete Offers",)),
                        ],
                      ),
                      SizedBox(height: 10,),
                      ConditionalBuilder(
                        builder: (context) => MyLine(),
                        fallback: (context) => LinearProgressIndicator(color:
                        HexColor(green.toString()),minHeight:2,),
                        condition: state is! AddOffersLoadingState  ,


                      ),
                      ConditionalBuilder(
                        builder: (context) => SizedBox(),
                        fallback: (context) => LinearProgressIndicator(color:
                        HexColor(green.toString()),minHeight:2,),
                        condition: state is! DeleteOffersLoadingState ,


                      ),
                      SizedBox(height: 30,),
                      Text(" loads :",style: TextStyle(fontSize: 16,  fontWeight: FontWeight.w400),),
                      SizedBox(height: 30,),
//                                       Row(
//
//                       children: [
//                         Expanded(
//
//                           flex:4,
//                           child: Container(
//
//                             child:defaultTextFieldPharmacyDashboard(
//                               controller: numberMedicine, type: TextInputType.number,
//                               validate: (value){
//
//                               },
//                               prefix: Icons.numbers_outlined,
//                               hint:"Number Medicine",
//
//
//
//
//                             ),
//                           ),
//                         ),
//
//
//                         Expanded(
//                           flex:1,
//                           child: Container(
//
//                             decoration: BoxDecoration(
//                               color:HexColor(green.toString()),
//
//                               borderRadius: BorderRadius.only(topRight: Radius.circular(35),bottomRight:Radius.circular(35)),
//                               gradient:LinearGradient(
//
//                                 begin:  Alignment.topCenter,
//                                 end:Alignment.bottomCenter ,
//
//                                 colors: [
//                                   HexColor('56949a'),
//                                   HexColor('3e8489'),
//
//                                 ],
//
//
//                               ),
//                             ),
//                             child: MaterialButton(
//                                 splashColor: HexColor(green.toString()),
//
//
//                                 onPressed: () {
//
//     PharmacyHomeCubit.get(context).deleteLoad(Warehousemedicines_load_id: numberMedicine.text);
//
//                                 },
//                                 child: Text("delete",style: TextStyle(color:Colors.white,fontSize: 12),)
//                             ),
//                           ),
//                         ),
//                       ],
//
//                     ),
//                       Row(
//
//                         children: [
//                           Expanded(
//
//                             flex:3,
//                             child:  Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(35),bottomLeft:Radius.circular(35)),
//                                 color: Colors.white.withOpacity(0.3),),
//                               child:Padding(
//                                 padding: const EdgeInsets.only(left: 16),
//                                 child: DropdownButton<String>(
//                                   menuMaxHeight: 300,
//
//                                   icon:  Icon(Icons.arrow_drop_down_outlined,color:
//                                   HexColor(green.toString())),
//                                   iconSize: 20,
//                                   dropdownColor: HexColor("E5E4E2"),
//                                   underline: const SizedBox(),
//                                   value: PharmacyHomeCubit.get(context).selectedMedicine,
//                                   onChanged: (String? newValue) {
//                                     setState(() {
//                                       PharmacyHomeCubit.get(context).changeSelectedMedicine(newValue!);
//
//                                     });
//                                   },
//                                   items: PharmacyHomeCubit.get(context).medicinesDropDownItems,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//
//                             flex:2,
//                             child: Container(
//
//                               decoration: BoxDecoration(
//                                 color: Colors.white.withOpacity(0.5),),
//                               child:defaultTextFieldPharmacyDashboard1(
//                                 controller: quantityAddLoads, type: TextInputType.text,
//                                 validate: (value){
//
//                                 },
//                                 hint:"quantity",
//
//
//
//
//                               ),
//                             ),
//                           ),
//
//                           Expanded(
//                             flex:1,
//                             child: Container(
//
//                               decoration: BoxDecoration(
//                                 color:HexColor(green.toString()),
//
//                                 borderRadius: BorderRadius.only(topRight: Radius.circular(35),bottomRight:Radius.circular(35)),
//                                 gradient:LinearGradient(
//
//                                   begin:  Alignment.topCenter,
//                                   end:Alignment.bottomCenter ,
//
//                                   colors: [
//                                     HexColor('56949a'),
//                                     HexColor('3e8489'),
//
//                                   ],
//
//
//                                 ),
//                               ),
//                               child: MaterialButton(
//                                   splashColor: HexColor(green.toString()),
//
//
//                                   onPressed: () {
//                            PharmacyHomeCubit.get(context).LoadAddMedicineWarehouse(
//                                warehouseMedicine_id:         CacheHelper.getData(key: "searchlistid")
// ,                             load_quantity: quantityAddLoads.text);
//
//                                   },
//                                   child: Text("add",style: TextStyle(color:Colors.white,fontSize: 12),)
//                               ),
//                             ),
//                           ),
//                         ],
//
//                       ),
                      SizedBox(height: 30,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: (){
                          //  PharmacyHomeCubit.get(context).getOffers(id: data[1]);
                               print(PharmacyHomeCubit.get(context).offerss);
                            Get.to(() =>Loads(), arguments: [
                              CacheHelper.getData(key: "searchlistid")


                              // searchlist[index]['offer'][index]['id']
                            ]);
                          }, child:Text("Go for delete Loads",)),
                        ],
                      ),
                      SizedBox(height: 20,),

                      ConditionalBuilder(
                        builder: (context) => SizedBox(),
                        fallback: (context) => LinearProgressIndicator(color:
                        HexColor(green.toString()),minHeight:2,),
                        condition: state is! AddLoadsLoadingState,


                      ),
                    ],
                  ),
                )
              ),
            ),
          ),
        );
      },
    );
  }
}

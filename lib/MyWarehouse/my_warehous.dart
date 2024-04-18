import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/drawer.dart';
import 'package:pharmacy/Medicen/pharmace_medisants.dart';
import 'package:pharmacy/Model/Register_pharmacy.dart';
import 'package:pharmacy/MyWarehouse/button.dart';
import 'package:pharmacy/MyWarehouse/button_Ware.dart';
import 'package:pharmacy/Rigester_pharmacy/cubit.dart';
import 'package:pharmacy/Rigester_pharmacy/states.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';
import 'package:pharmacy/update_information_medicine/Medicine_WareHouse.dart';
import 'package:pharmacy/update_information_medicine/Search.dart';
class MyWarehouse extends StatefulWidget {
  const MyWarehouse({Key? key}) : super(key: key);

  @override
  State<MyWarehouse> createState() => _MyWarehouseState();
}

class _MyWarehouseState extends State<MyWarehouse> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return  Scaffold(
          // appBar: AppBar(
          //   toolbarHeight:80,
          //   titleSpacing: 8,
          //   leadingWidth: 58,
          //   elevation: 0.0,
          //   flexibleSpace: Container(
          //     height: double.infinity,
          //     width: double.infinity,
          //     decoration: BoxDecoration(
          //       gradient:LinearGradient(
          //
          //         begin:  Alignment.topRight,
          //         end:Alignment.bottomLeft ,
          //
          //         colors: [
          //           HexColor('A8BEE7'),
          //           HexColor('AEC9DE'),//gray light
          //           //gray dark
          //           HexColor('BBC5CE'),
          //
          //
          //
          //         ],
          //         tileMode: TileMode.clamp,
          //
          //       ),
          //     ) ,
          //   ),
          //   leading:Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: IconButton(onPressed: () {
          //       navigateTo(widget:drawerScreen() ,context:context);
          //     }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
          //   )
          //   ,
          //   title: Row(
          //     children: [
          //       Text("My Warehouse",style: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.normal),),
          //     ],
          //   ) ,
          //   // actions: [
          //   //   Padding(
          //   //     padding: const EdgeInsets.only(right: 24.0),
          //   //     child: LottieBuilder.asset("images/124405-prescription.json",width: 40,height: 40,),
          //   //   )
          //   // ],
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
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16, color: Colors.black,
              )),
            ),
            leading:Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: () {
                navigateAndFinish(context: context,widget: drawerScreen());
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
            child: SingleChildScrollView(
              physics:  BouncingScrollPhysics(),
              child: Column(

                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 100000,
                      child: ConditionalBuilder(
                        builder: (context) => ConditionalBuilder(
                            condition: PharmacyHomeCubit.get(context).modelPharmacy.warehouses!.isNotEmpty,
                          builder: (context) => ListView.separated(
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder:(context, index) => Pharma(context,PharmacyHomeCubit.get(context).modelPharmacy.warehouses![index]),
                            separatorBuilder:(context, index) => const SizedBox(height: 10),
                            itemCount: PharmacyHomeCubit.get(context).modelPharmacy.warehouses!.length),
                            fallback: (context) => Padding(
                              padding: const EdgeInsets.only(top:400.0),
                              child: Text("There are no Warehouse",style:TextStyle(color: Colors.grey,fontSize: 20) ,),
                            ),),
                        fallback: (context) =>Center(child: CircularProgressIndicator(color:  HexColor(green.toString()))),
                        condition:state is !PharmacyWLoadingState  ,


                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),


        );
      },
    );
  }
  Widget Pharma(context,Warehouses pharmacies) => InkWell(
    onTap: () {
      CacheHelper.saveData(key:"idW", value:   pharmacies.id);
      CacheHelper.saveData(key:"www", value:   pharmacies.warehouseName);
      CacheHelper.saveData(key:"nnn", value:   pharmacies.number);
     PharmacyHomeCubit.get(context).getMedicineSearch(id: CacheHelper.getData(key: "idW"));


     if(pharmacies.validated==0){
        showToast(text: "Waiting for verification", state: ToastStates.EROOR);
     }
      else{
       Get.to(() => ButtonWare(), arguments: [

         CacheHelper.getData(key: "idW"),


       ]);
     }
    },
    child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),

              color: Colors.white.withOpacity(0.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30,),
                            Row(
                              children: [
                                Text('339'.tr,overflow: TextOverflow.ellipsis),
                                Spacer(),
                                Text(" ${pharmacies.warehouseName!}",overflow: TextOverflow.ellipsis),


                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text('340'.tr,overflow: TextOverflow.ellipsis,),
                                Spacer(),
                                Text("${pharmacies.number!}",overflow: TextOverflow.ellipsis,),

                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color:pharmacies.validated==0?Colors.grey[400] :HexColor(green.toString()),

              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topRight: Radius.circular(16)
              ),
            ),
            height: 30,
            width: 150,
            child:  Center(
              child: Text(pharmacies.validated==0?"Waiting for verification":"investigator",style: TextStyle(
                  color: Colors.white,
                  fontSize: 12
              )),
            ),

          ),
        ]),
  );
  // Widget pharma(context,Warehouses pharmacies)=>InkWell(
  //
  //   onTap: () {
  //     CacheHelper.saveData(key:"idW", value:   pharmacies.id);
  //     Get.to(() => ButtonWare(), arguments: [
  //
  //      CacheHelper.getData(key: "idW"),
  //
  //
  //     ]);
  //
  //     // PharmacyHomeCubit.get(context).getOffers(id: pharmacies.id);
  //     // PharmacyHomeCubit.get(context).getLoads(id: pharmacies.id);
  //     PharmacyHomeCubit.get(context).getMedicineSearch(id:pharmacies.id);
  //     //print(PharmacyHomeCubit.get(context).offerss);
  //   },
  //   child: Container(
  //     height: 100,
  //     clipBehavior: Clip.antiAliasWithSaveLayer,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(16),
  //       color:HexColor("E5E4E2"),
  //     ),
  //
  //     child: Stack(
  //       alignment: AlignmentDirectional.topEnd,
  //       children: [
  //         Row(
  //
  //           children: [
  //             ClipRRect(
  //               borderRadius:const BorderRadius.only(topLeft:Radius.circular(16)
  //                   ,bottomLeft:Radius.circular(15)  ) ,
  //               child: Image(image:NetworkImage("http://192.168.43.142:8000/${pharmacies.pathOfPhoto!}"),
  //                   height: 100,width: 100,fit: BoxFit.cover),
  //             ),
  //
  //             const SizedBox(width: 15),
  //             Column(
  //               mainAxisAlignment:MainAxisAlignment.start ,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 SizedBox(height: 5),
  //                 Expanded(
  //
  //                   child: Row(
  //                     children: [
  //                       // Text("Warehouse Name: ",style: TextStyle(
  //                       //     fontSize: 14,
  //                       //     color: HexColor(green.toString()),
  //                       //
  //                       //     fontWeight: FontWeight.bold
  //                       // ),),
  //                       // SizedBox(height: 4),
  //                       Text("  ${pharmacies.warehouseName!}",overflow: TextOverflow.ellipsis,style: TextStyle(
  //                           fontSize: 12,
  //                           fontWeight: FontWeight.normal
  //                       ),),
  //                       SizedBox(height: 4),
  //                     ],
  //                   ),
  //                 ),
  //                 SizedBox(height: 5),
  //                 Expanded(
  //
  //                   child: Row(
  //                     children: [
  //                       // Text("Warehouse Number: ",style: TextStyle(
  //                       //     fontSize: 14,
  //                       //     color: HexColor(green.toString()),
  //                       //
  //                       //     fontWeight: FontWeight.bold
  //                       // ),),
  //                       // SizedBox(height: 4),
  //                       Text(" ${pharmacies.number!}",overflow: TextOverflow.ellipsis,style: TextStyle(
  //                           fontSize: 10,
  //                           fontWeight: FontWeight.normal
  //                       ),),
  //                     ],
  //                   ),
  //                 ),
  //                 SizedBox(height: 14),
  //                 Expanded(
  //
  //                   child: Row(
  //
  //                     children: [
  //
  //                       Icon(Icons.location_on,color: HexColor(green.toString()),size: 13),
  //                       const SizedBox(width: 3,),
  //                       const Text("2.0 km",style: TextStyle(
  //                           fontSize: 11
  //                       ),),
  //                     ],
  //                   ),
  //                 ),
  //
  //               ],
  //             ),
  //
  //
  //           ],
  //         ),
  //         Container(
  //           decoration: BoxDecoration(
  //             color:pharmacies.validated==0?Colors.grey[400] :HexColor(green.toString()),
  //
  //             borderRadius: const BorderRadius.only(
  //                 bottomLeft: Radius.circular(16),
  //                 topRight: Radius.circular(16)
  //             ),
  //           ),
  //           height: 30,
  //           width: 150,
  //           child:  Center(
  //             child: Text(pharmacies.validated==0?"Waiting for verification":"investigator",style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 12
  //             )),
  //           ),
  //
  //         ),
  //       ],
  //     ),
  //   ),
  // );
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/make_order/chooseWarehouse.dart';
import 'package:pharmacy/make_order/mid.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';

class Next extends StatelessWidget {
   Next({Key? key}) : super(key: key);
  var data=Get.arguments;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(

        builder: (context, state) {
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
            //       navigateTo(context: context,widget: WarehouseMakeOrder());
            //
            //     }, icon:Icon(Icons.arrow_back,)),
            //   ),
            //   title: Padding(
            //     padding: const EdgeInsets.all(16.0),
            //     child: Text("Choose the type of order", ),
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
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child:  Text("318".tr,
                    style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20, color: Colors.grey.shade800,
                    )),
              ),
              leading:Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(onPressed: () {
                  navigateTo(context: context,widget: WarehouseMakeOrder());          }, icon: Icon(Icons.arrow_back_ios_new_outlined,color:HexColor(green),)),
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
              child:  SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  height: 1000,
                  child:   Padding(
                    padding: const EdgeInsets.only(top:200.0,right: 20,left: 40),
                    child: Column(

                      children: [
                        Row(
                          children: [
                            Image.asset("images/addEmploy.png",width: 50,  height: 50),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Icon(
                                      Icons.circle_outlined,
                                      color: HexColor(green),
                                      size: 20,
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: HexColor(green),
                                      size: 10,
                                    ),
                                  ],
                                ),
                                SizedBox(height:4 ,),
                                Icon(
                                  Icons.circle,
                                  color:Colors.grey,
                                  size: 4,
                                ),
                                SizedBox(height:4 ,),
                                Icon(
                                  Icons.circle,
                                  color:Colors.grey,
                                  size: 4,
                                ),
                                SizedBox(height:4 ,),
                                Icon(
                                  Icons.circle,
                                  color:Colors.grey,
                                  size: 4,
                                ),
                                SizedBox(height:4 ,),
                                Icon(
                                  Icons.circle,
                                  color:Colors.grey,
                                  size: 4,
                                ),

                              ],
                            ),
                            SizedBox(width: 10,),
                            InkWell(
                              onTap: (){
                                if(PharmacyHomeCubit.get(context).allMedicine.warehouseMedicines!.isEmpty){
                                  showToast(text:"Medicine not found", state: ToastStates.EROOR);
                                }
                                 else{
                                  Get.to(() => WarehouseMakeOrder(), arguments: [
                                    CacheHelper.getData(key: "_dateController")

                                  ]);
                                }
                              },
                              child: Container(
                                width: 240,
                                height: 60,

                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),

                                  color: Colors.white.withOpacity(0.3),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0,top: 10),
                                  child:  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("316".tr,style: TextStyle(fontWeight: FontWeight.w500)),
                                      SizedBox(height: 5,),
                                      Text("317".tr,style: TextStyle(color: Colors.grey,fontSize: 12)),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Image.asset("images/addEmploy.png",width: 50,  height: 50),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Icon(
                                      Icons.circle_outlined,
                                      color: HexColor(green),
                                      size: 20,
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: HexColor(green),
                                      size: 10,
                                    ),
                                  ],
                                ),
                                SizedBox(height:4 ,),
                                Icon(
                                  Icons.circle,
                                  color:Colors.grey,
                                  size: 4,
                                ),
                                SizedBox(height:4 ,),
                                Icon(
                                  Icons.circle,
                                  color:Colors.grey,
                                  size: 4,
                                ),
                                SizedBox(height:4 ,),
                                Icon(
                                  Icons.circle,
                                  color:Colors.grey,
                                  size: 4,
                                ),
                                SizedBox(height:4 ,),
                                Icon(
                                  Icons.circle,
                                  color:Colors.grey,
                                  size: 4,
                                ),

                              ],
                            ),
                            SizedBox(width: 10,),
                            InkWell(
                              onTap: (){

                              },
                              child: Container(
                                width: 240,
                                height: 60,

                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),

                                  color: Colors.white.withOpacity(0.3),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0,top: 10),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Order baskets",style: TextStyle(fontWeight: FontWeight.w500)),
                                      SizedBox(height: 5,),
                                      Text("from warehouse medicine",style: TextStyle(color: Colors.grey,fontSize: 12)),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),


                      ],
                    ),
                  ),

                ),
              ),

            ),
          );
        }, listener: (context, state) {

        },);
  }
}

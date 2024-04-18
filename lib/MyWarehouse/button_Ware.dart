import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/MyPharmacy/my_pharmacy.dart';
import 'package:pharmacy/MyWarehouse/button.dart';
import 'package:pharmacy/MyWarehouse/my_warehous.dart';
import 'package:pharmacy/orderWarehouse/cubit.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';
import 'package:pharmacy/update_information_medicine/Search.dart';

import '../orderWarehouse/OrderWarehouse.dart';
import '../shared/components/constant.dart';

class ButtonWare extends StatefulWidget {
  const ButtonWare({Key? key}) : super(key: key);

  @override
  State<ButtonWare> createState() => _ButtonWareState();
}

class _ButtonWareState extends State<ButtonWare> {
  @override
  Widget build(BuildContext context) {
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
      //       navigateTo(context: context,widget: MyWarehouse());              }, icon:Icon(Icons.arrow_back,)),
      //   ),
      //   title: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Text("Choose ", ),
      //   ),
      //
      //
      // ),
      extendBodyBehindAppBar: true,
      appBar:   AppBar(
        toolbarHeight: 150,
        leadingWidth:double.infinity,
        elevation: 0.0,

        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
            child: Container(color: Colors.transparent,),
          ),
        ),

        backgroundColor:Colors.white.withAlpha(100) ,

        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0,left: 8,right: 8),
              child: IconButton(onPressed: () {
                navigateAndFinish(context: context,widget: MyWarehouse());
              }, icon: Icon(Icons.arrow_back_ios_new_outlined,color:HexColor(green),)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0,left: 34,right: 34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("313".tr,
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Colors.grey.shade800
                        ),
                      ),
                      Spacer(),
                      Text("${CacheHelper.getData(key: "www")}",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Colors.grey.shade800
                        ),
                      ),
                    ],
                  ),//
                  SizedBox(height: 10,),
                  Row(

                    children: [

                      Text("${'304'.tr}",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade600
                        ),

                      ),
                     Spacer(),
                      Text("${CacheHelper.getData(key: "nnn")}",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade600
                        ),

                      ),
                    ],),
                ],
              ),
            ),

          ],
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
              padding: const EdgeInsets.only(top:250.0,right: 40,left: 40),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset("images/icons8-employees-96.png",width: 50,  height: 50),
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
                          Get.to(() => ButtonWarehouse(), arguments: [


                          ]);
                        },
                        child: Container(
                          width: 240,
                          height: 70,

                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),

                            color: Colors.white.withOpacity(0.3),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(left: 20.0,top: 10,right: 20),
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("362".tr,style: TextStyle(fontWeight: FontWeight.w500)),
                                SizedBox(height: 5,),
                                Text("365".tr,style: TextStyle(color: Colors.grey,fontSize: 12)),
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
                      Image.asset("images/icons8-medicine-64 (1).png",width: 50,  height: 50),
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
                          Get.to(() => Search(), arguments: [
                            CacheHelper.getData(key: "idW"),
                            PharmacyHomeCubit.get(context).getSearch(value:'', id: CacheHelper.getData(key:  "idW")),

                          ]);
                        },
                        child: Container(
                          width: 240,
                          height: 70,

                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),

                            color: Colors.white.withOpacity(0.3),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(left: 20.0,top: 10,right: 20),
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("353".tr,style: TextStyle(fontWeight: FontWeight.w500)),
                                SizedBox(height: 5,),
                                Text("367".tr,style: TextStyle(color: Colors.grey,fontSize: 12)),
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
                      Image.asset("images/icons8-order-96.png",width: 50,  height: 50),
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
                          OrderWarehouseCubit.get(context).getOrderWarehouse(id:CacheHelper.getData(key: "idW"));
                          OrderWarehouseCubit.get(context).getDis();
                          print( CacheHelper.getData(key: "idW"),);
                          Get.to(() => OrderWarehouse(), arguments: [

                            CacheHelper.getData(key: "idW"),

                          ]);
                        },
                        child: Container(
                          width: 240,
                          height: 70,

                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),

                            color: Colors.white.withOpacity(0.3),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0,top: 10,right: 20),
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("320".tr,style: TextStyle(fontWeight: FontWeight.w500)),
                                SizedBox(height: 5,),
                                Text("368".tr,style: TextStyle(color: Colors.grey,fontSize: 12)),
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
  }
}

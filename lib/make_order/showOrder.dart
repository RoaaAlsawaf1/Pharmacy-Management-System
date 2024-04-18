import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/make_order/mid.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';

import 'Success_Screen_newOrder.dart';


class Order extends StatefulWidget {
   Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  var dataa=Get.arguments;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit, PharmacyHomeStates>(
      listener: (context, state) {
        if(state is CreateOrderSuccessState){
          if(state.value==200){
            //showToast(text: "ss", state:  ToastStates.EROOR);
            navigateAndFinish(context: context,widget: SuccessScreen());

            PharmacyHomeCubit.get(context).removeShowMapClear();
            PharmacyHomeCubit.get(context).dataMapclear();
          }
        }
      },
      builder: (context, state) {
        PharmacyHomeCubit.get(context).showOrder;
       return Scaffold(
//           appBar: AppBar(
//             toolbarHeight: 80,
//             titleSpacing: 0.0,
//             leadingWidth: 70,
//             elevation: 0.0,
//             flexibleSpace: Container(
//               height: double.infinity,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topRight,
//                   end: Alignment.bottomLeft,
//                   colors: [
//                     HexColor('A8BEE7'),
//                     HexColor('AEC9DE'), //gray light
// //gray dark
//                     HexColor('BBC5CE'),
//                   ],
//                   tileMode: TileMode.clamp,
//                 ),
//               ),
//             ),
//             title: const Text("My Order",style: TextStyle( color: Colors.black87)),
//             leading:Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: IconButton(onPressed: () {
//                 Get.to(() =>  MedicineList(), arguments: [
//                //   dataa[0]
//                 ]);
//               //  navigateAndFinish(widget: MedicineList(),context: context);
//               }, icon:const Icon(Icons.arrow_back,color: Colors.black87,)),
//             ),
//
//           ),
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
             padding: const EdgeInsets.symmetric(horizontal: 70.0),
             child:  Text("343".tr,
                 style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20, color: Colors.grey.shade800,
                 )),
           ),
           leading:Padding(
             padding: const EdgeInsets.all(8.0),
             child: IconButton(onPressed: () {

               navigateAndFinish(widget: MedicineList(),context: context);
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
              child: Container(
                height: 100000,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 40),          child: SizedBox(
                  height:800,
                  child: ConditionalBuilder(
                    builder: (context) => ListView.separated(

                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            buildMedicine(context,PharmacyHomeCubit.get(context).showOrder[index],index),
                        separatorBuilder: (context, index) => MyLine(),
                        itemCount:PharmacyHomeCubit.get(context).showOrder.length),
                    condition:PharmacyHomeCubit.get(context).showOrder.isNotEmpty ,
                    fallback:(context) => Center(child: Text("There are no order",style:TextStyle(color: Colors.grey,fontSize: 20) ,)) ,
                  ),
                ),
                ),
              ),
            ),
          ),
         floatingActionButton:Padding(
           padding: const EdgeInsets.all(16.0),
           child: FloatingActionButton(

             splashColor: HexColor(green.toString()),

             onPressed: () {
                 PharmacyHomeCubit.get(context).createOrder(dataMap:PharmacyHomeCubit.get(context).dataMapMy, time: dataa[0]);

             },child: Text("357".tr,style: TextStyle(color: Colors.white,fontSize: 12)),),
         ),
         floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        );
      },
    );
  }

  Widget buildMedicine(context, show,index) =>  InkWell(
    onTap: () {

    },
    child: Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [

        Container(


          width: double.infinity,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),

          ),
          child:  Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("${'353'.tr}",style: TextStyle(fontSize: 16)),
                    Spacer(),
                    Text("${show["medicine_en"]}",style: TextStyle(fontSize: 16)),

                  ],
                ),
                Row(
                  children: [
                    Text("${'347'.tr}",style: TextStyle(fontSize: 16)),
                    Spacer(),
                    Text("${show["commercial_price"]}",style: TextStyle(fontSize: 16)),

                  ],
                ),
                Row(
                  children: [

                    Text("${'346'.tr}",style: TextStyle(fontSize: 16)),
                    Spacer(),
                    Text("${show["net_price"]}",style: TextStyle(fontSize: 16)),

                  ],
                ),
                Row(
                  children: [
                    Text("${'349'.tr}",style: TextStyle(fontSize: 16)),
                    Spacer(),
                    Text("${show["quantity"]}",style: TextStyle(fontSize: 16)),

                  ],
                ),
                Row(
                  children: [
                    Text("350".tr,style: TextStyle(fontSize: 16)),
                  ],
                ),
                Row(
                  children: [
                    Text("${'349'.tr}${show["freeQuantity"]}   "
                        ,style: TextStyle(fontSize: 12,color:Colors.grey)),
                    Text("${'358'.tr}${show["freeQuantity"]}"
                        ,style: TextStyle(fontSize: 12,color:Colors.grey)),
                  ],
                ),

                Text("${'359'.tr}",style: TextStyle(fontSize: 16)),
                Row(
                  children: [
                    Text("${'353'.tr}${show["medicineLoad"]}   "
                        ,style: TextStyle(fontSize: 12,color:Colors.grey)),
                    Text("${'349'.tr}${show["quantityLoad"]}"
                        ,style: TextStyle(fontSize: 12,color:Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
          setState(() {
            showToast(text: " delete Successfully", state:ToastStates.EROOR);
            print(" قبل ${PharmacyHomeCubit.get(context).dataMapMy}");
            print(" قبل ${PharmacyHomeCubit.get(context).showOrder}");

            PharmacyHomeCubit.get(context).changeChecked(index);
            PharmacyHomeCubit.get(context).changeVisibilityRemove(index);
            PharmacyHomeCubit.get(context).changeVisibilityAdd(index);
            PharmacyHomeCubit.get(context).removeShowMap(index);
            PharmacyHomeCubit.get(context).dataMap(index);

            print(" قبل ${PharmacyHomeCubit.get(context).dataMapMy}");
            print(" قبل ${PharmacyHomeCubit.get(context).showOrder}");

          });
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color:HexColor(green.toString()),

                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    topLeft: Radius.circular(16)
                ),
              ),
              height: 30,
              width: 100,
              child:  Center(child: Text("360".tr,style: TextStyle(color: Colors.white,fontSize: 14),)),

            ),
          ),
        ),



      ],

    ),
  );
}

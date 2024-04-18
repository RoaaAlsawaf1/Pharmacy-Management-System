import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/MyWarehouse/button_Ware.dart';
import 'package:pharmacy/orderWarehouse/ModelForOrderWare.dart';
import 'package:pharmacy/orderWarehouse/cubit.dart';
import 'package:pharmacy/orderWarehouse/orderdetails.dart';
import 'package:pharmacy/orderWarehouse/statue.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';


class OrderWarehouse extends StatefulWidget {
  const OrderWarehouse({Key? key}) : super(key: key);

  @override
  State<OrderWarehouse> createState() => _OrderWarehouseState();
}

class _OrderWarehouseState extends State<OrderWarehouse> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderWarehouseCubit,OrderWarehouseStates>(
       listener: (context, state) {

       },
      builder: (context, state) {
        return  Scaffold(
//             appBar:   AppBar(
//               toolbarHeight: 80,
//               titleSpacing: 0.0,
//               leadingWidth: 70,
//               elevation: 0.0,
//               flexibleSpace: Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topRight,
//                     end: Alignment.bottomLeft,
//                     colors: [
//                       HexColor('A8BEE7'),
//                       HexColor('AEC9DE'), //gray light
// //gray dark
//                       HexColor('BBC5CE'),
//                     ],
//                     tileMode: TileMode.clamp,
//                   ),
//                 ),
//               ),
//               title: const Text("My Order",style: TextStyle( color: Colors.black87)),
//               leading:Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: IconButton(onPressed: () {
//                   navigateTo(context: context,widget: ButtonWare());
//                 }, icon:const Icon(Icons.arrow_back,color: Colors.black87,)),
//               ),
//
//             ),
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
                child:  Text("My Order",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16, color: Colors.grey.shade800,
                )),
              ),
              leading:Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(onPressed: () {
                  navigateAndFinish(context: context,widget: ButtonWare());                }, icon: Icon(Icons.arrow_back_ios_new_outlined,color:HexColor(green),)),
              ),

            ),
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      HexColor('A8BEE7'),
                      HexColor('AEC9DE'), //gray light
                      //gray dark
                      HexColor('BBC5CE'),
                      HexColor('BDB9C7'), //
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
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                    child: Container(
                      height:100000,
                      child: ConditionalBuilder(
                        condition:state is !OrderWarehouseLoadingState ,
                        builder:(context) => ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                ConditionalBuilder(
                                  condition:OrderWarehouseCubit.get(context).orderWarehouse.warehouseOrders!.isNotEmpty ,
                                  builder: (context) =>  buildOrderItem(context,OrderWarehouseCubit.get(context).orderWarehouse.warehouseOrders![index]),
                                  fallback:(context) => Center(child: Padding(
                                    padding: const EdgeInsets.only(top: 300.0),
                                    child: Text("There are no Order",style:TextStyle(color: Colors.grey,fontSize: 20) ,),
                                  )),)
                            ,
                            separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                            itemCount: OrderWarehouseCubit.get(context).orderWarehouse.warehouseOrders!.length),
                        fallback:(context) => Padding(
                          padding: const EdgeInsets.only(top:400.0),
                          child: CircularProgressIndicator(color: HexColor(green)),
                        ) ,
                      ),
                    ),
                  ),
                )));
      },
    );

  }

  Widget buildOrderItem(context,WarehouseOrders warehouseOrders) => Stack(
  alignment: AlignmentDirectional.bottomEnd,
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
    Row(
      children: [
        Text("${"375".tr}",overflow: TextOverflow.ellipsis,),
        Spacer(),
        Text("${warehouseOrders.pharmacy!.pharmacyName}",overflow: TextOverflow.ellipsis,),

      ],
    ),
    SizedBox(
    height: 20,
    ),
    Row(
      children: [
        Text("${"340".tr}",overflow: TextOverflow.ellipsis,),
        Spacer(),
        Text("${warehouseOrders.pharmacy!.number}",overflow: TextOverflow.ellipsis,),

      ],
    ),
    SizedBox(
    height: 20,
    ),
    Row(
      children: [
        Text("${"341".tr}",
        style: TextStyle(
        color: Colors.grey,
          fontSize: 14
        )),
        Spacer(),
        Text("${warehouseOrders.date}",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 14
            )),
      ],
    ),
      SizedBox(height: 20,)
    ],
    ),
  ),
  ],
  ),
  )
  ],
  ),
  ),
  GestureDetector(
  onTap: (){
    CacheHelper.saveData(key:"stateinv", value: warehouseOrders.state);
    CacheHelper.saveData(key:"order_id_W", value: warehouseOrders.id);
    CacheHelper.saveData(key:"pharmacy_name_order", value: warehouseOrders.pharmacy!.pharmacyName);
    CacheHelper.saveData(key:"dateOrderWarehouse", value: warehouseOrders.date);
  OrderWarehouseCubit.get(context).postDetails(order_id:CacheHelper.getData(key: "order_id_W"),
      warehouse_id:CacheHelper.getData(key: "idW"));


    navigateTo(
  widget: OrderDetailsWarehouse(),context: context
  );
  },
  child: Container(
  decoration: BoxDecoration(

  color:warehouseOrders.state==1?HexColor(green.toString()):Colors.grey,//warehouseOrders.state==1? HexColor(green.toString()):Colors.grey
  borderRadius: BorderRadius.only(
  bottomRight: Radius.circular(16),
  topLeft: Radius.circular(16)),
  ),
  height: 30,
  width: 140,
  child: Center(
  child: Text("342".tr,
  style: TextStyle(color: Colors.white, fontSize: 14)),
  ),
  ),
  ),
  ]);
  }





import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/EmployeeWork/ModelForOrderWare.dart';
import 'package:pharmacy/EmployeeWork/Warehouse_works.dart';
import 'package:pharmacy/EmployeeWork/orderdetails.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';

import '../shared/components/constant.dart';

class OrderWarehouseWork extends StatefulWidget {
   OrderWarehouseWork({Key? key}) : super(key: key);

  @override
  State<OrderWarehouseWork> createState() => _OrderWarehouseWorkState();
}

class _OrderWarehouseWorkState extends State<OrderWarehouseWork> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
       listener: (context, state) {

       },
      builder: (context, state) {
        return  Scaffold(
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
                child:  Text("My Order",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20, color: Colors.grey.shade800,
                )),
              ),
              leading:Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(onPressed: () {
                  navigateAndFinish(context: context,widget: WareHouseWorks());
                  }, icon: Icon(Icons.arrow_back_ios_new_outlined,color:HexColor(green),)),
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
                      height:10000,
                      child: ConditionalBuilder(
                        condition:state is !OrderWarehouseLoadingState ,
                        builder:(context) => ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                ConditionalBuilder(
                                  condition:PharmacyHomeCubit.get(context).orderWarehouse.warehouseOrders!.isNotEmpty ,
                                  builder: (context) =>  buildOrderItem(context,PharmacyHomeCubit.get(context).orderWarehouse.warehouseOrders![index]),
                                  fallback:(context) => Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Text("There are no Order",style:TextStyle(color: Colors.grey,fontSize: 20) ,),
                                  ),)
                            ,
                            separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                            itemCount: PharmacyHomeCubit.get(context).orderWarehouse.warehouseOrders!.length),
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
  color: Colors.white.withOpacity(0.3),
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
  Column(
  children: [
  Text("Pharamcy :${warehouseOrders.pharmacy!.pharmacyName}",overflow: TextOverflow.ellipsis,),
  SizedBox(
  height: 20,
  ),
  Text("Number :${warehouseOrders.pharmacy!.number}",overflow: TextOverflow.ellipsis,),

  ],
  ),
  SizedBox(
  height: 20,
  ),
  Text("Order Date : ${warehouseOrders.date}",
  style: TextStyle(
  color: Colors.grey,
    fontSize: 14
  )),
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
    CacheHelper.saveData(key:"stateinvWork", value: warehouseOrders.state);
    CacheHelper.saveData(key:"order_id_Work", value: warehouseOrders.id);
    CacheHelper.saveData(key:"pharmacy_name_order_work", value: warehouseOrders.pharmacy!.pharmacyName);
    CacheHelper.saveData(key:"dateOrderWarehouse_work", value: warehouseOrders.date);
  PharmacyHomeCubit.get(context).postDetails(order_id:CacheHelper.getData(key: "order_id_Work"),
      warehouse_id:CacheHelper.getData(key: "idWEmployee"));


    navigateTo(
  widget: OrderDetailsWarehouseWork(),context: context
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
  child: Text(" Order details",
  style: TextStyle(color: Colors.white, fontSize: 14)),
  ),
  ),
  ),
  ]);
  }


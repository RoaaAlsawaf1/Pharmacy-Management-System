import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/drawer.dart';
import 'package:pharmacy/InvoicesOrder/ModelShowOrder.dart';
import 'package:pharmacy/orderWarehouse/cubit.dart';
import 'package:pharmacy/orderWarehouse/statue.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';

import 'invoices_details.dart';

class InvoicesOrder extends StatefulWidget {
  const InvoicesOrder({Key? key}) : super(key: key);

  @override
  State<InvoicesOrder> createState() => _InvoicesOrderState();
}

class _InvoicesOrderState extends State<InvoicesOrder> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderWarehouseCubit,OrderWarehouseStates>(
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
                child:  Text("337".tr,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 1000,
                          child: ConditionalBuilder(
                            condition:state is !InvoicesShowWarehouseLoadingState ,
                            builder:(context) => ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    ConditionalBuilder(
                                      condition:OrderWarehouseCubit.get(context).invoices.dispenserinvoices!.isNotEmpty ,
                                      builder: (context) =>  buildInvoicesItem(context,OrderWarehouseCubit.get(context).invoices.dispenserinvoices![index]),
                                      fallback:(context) =>  Center(child: Padding(
                                        padding: EdgeInsets.only(bottom: 100.0),
                                        child: Text("338".tr,style:TextStyle(color: Colors.grey,fontSize: 20) ,),
                                      )),)
                                ,
                                separatorBuilder: (context, index) => const SizedBox(
                                  height: 10,
                                ),
                                itemCount: OrderWarehouseCubit.get(context).invoices.dispenserinvoices!.length),
                            fallback:(context) => Center(child: CircularProgressIndicator(color: HexColor(green))) ,
                          ),
                        ),
                      ),
                    ],
                  ),
                )));
      },
    );
  }
  Widget buildInvoicesItem(context,Dispenserinvoices dispenserinvoices) => Stack(
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
                              Text(" ${dispenserinvoices.buyOrder!.pharmacy!.pharmacyName}",overflow: TextOverflow.ellipsis),

                           //   Text("${"339".tr}${dispenserinvoices.buyOrder!.pharmacy!.pharmacyName}",overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500),),


                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text('340'.tr,overflow: TextOverflow.ellipsis,),
                              Spacer(),
                              Text("${dispenserinvoices.buyOrder!.pharmacy!.number}",overflow: TextOverflow.ellipsis,),

                             // Text("${"339".tr}${dispenserinvoices.buyOrder!.pharmacy!.number}",overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500)),

                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text("${"341".tr}${dispenserinvoices.buyOrder!.date}",
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12
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
            CacheHelper.saveData(key:"state_invoices", value:dispenserinvoices.state);
            CacheHelper.saveData(key:"invoices_id_", value: dispenserinvoices.id);
            CacheHelper.saveData(key:"pharmacy_name_invoices", value: dispenserinvoices.buyOrder!.pharmacy!.pharmacyName);
            CacheHelper.saveData(key:"dateInvoicesWarehouse", value: dispenserinvoices.buyOrder!.date);
            OrderWarehouseCubit.get(context).postDetailsInvoices(invoice_id:CacheHelper.getData(key: "invoices_id_")
                );


            navigateTo(
                widget: const InvoicesDetails(),context: context
            );
          },
          child: Container(
            decoration: BoxDecoration(

              color:dispenserinvoices.state==0?HexColor(green.toString()):Colors.grey.withOpacity(0.3),//warehouseOrders.state==1? HexColor(green.toString()):Colors.grey
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topRight: Radius.circular(16)),
            ),
            height: 30,

            width: 140,
            child:  Center(
              child: Text("342".tr,
                  style: TextStyle(color: Colors.white, fontSize: 14)),
            ),
          ),
        ),
      ]);
}

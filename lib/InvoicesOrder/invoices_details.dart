import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/InvoicesOrder/BarQude.dart';
import 'package:pharmacy/InvoicesOrder/ModelShowdetail.dart';
import 'package:pharmacy/InvoicesOrder/invoices_Show_order.dart';
import 'package:pharmacy/orderWarehouse/cubit.dart';
import 'package:pharmacy/orderWarehouse/statue.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';

class InvoicesDetails extends StatefulWidget {
  const InvoicesDetails({Key? key}) : super(key: key);

  @override
  State<InvoicesDetails> createState() => _InvoicesDetailsState();
}

class _InvoicesDetailsState extends State<InvoicesDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderWarehouseCubit,OrderWarehouseStates>(
      listener: (context, state) {
        if(state is InvoicesDetailsWarehouseSuccessState){
          if(state.value==200){



          }
        }
      },
      builder: (context, state) {
        return Scaffold(
        extendBodyBehindAppBar: true,
            appBar:   AppBar(
              toolbarHeight: 140,
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
                    padding: const EdgeInsets.only(top: 16.0,left: 8),
                    child: IconButton(onPressed: () {
                      navigateAndFinish(context: context,widget: const InvoicesOrder());
                    }, icon: Icon(Icons.arrow_back_ios_new_outlined,color:HexColor(green),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0,left: 34),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("303".tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  color: Colors.grey.shade800
                              ),
                            ),
                            SizedBox(width: 2,),
                            Text("${CacheHelper.getData(key: "pharmacy_name_invoices")}",
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

                            Text(" ${CacheHelper.getData(key: "dateInvoicesWarehouse")}",
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
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          height: 1900,
                          child: ConditionalBuilder(
                            condition: state is !InvoicesDetailsWarehouseLoadingState,
                            builder: (context) => ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    buildOrderMedicineItem(OrderWarehouseCubit.get(context).invoicesDetails.dispenserInvoicesDetails![index]),
                                separatorBuilder: (context, index) => MyLine(),
                                itemCount: OrderWarehouseCubit.get(context).invoicesDetails.dispenserInvoicesDetails!.length),
                            fallback:(context) => Center(child: CircularProgressIndicator(color: HexColor(green))) ,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          floatingActionButton:  InkWell(
            onTap: () {
              navigateTo(context: context, widget: Pharmacy_Read_QRCode());
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
                width: 180,
                child:  Center(child: Text("329".tr,style: TextStyle(color: Colors.white,fontSize: 14),)),

              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
      },
    );
  }
  Widget buildOrderMedicineItem(DispenserInvoicesDetails invoicesDetails) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Icon(
                Icons.circle_outlined,
                color: HexColor(green),
                size: 18,
              ),
              Icon(
                Icons.circle,
                color: HexColor(green),
                size: 10,
              ),
            ],
          ),
          const SizedBox(
            width: 8,
          ),
           Text(
            "330".tr,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Text(
            "${invoicesDetails.warehouseMedicine!.medicine!.tradeNameEn}",maxLines: 2,
            style: TextStyle(fontSize: 14,),
          ),

          Text(

            "${invoicesDetails.warehouseMedicine!.medicine!.tradeNameAr}" ,maxLines: 2,
            style: TextStyle(fontSize: 14,),
          ),

          const SizedBox(
            width: 8,
          ),


        ],
      ),
      const SizedBox(height: 16,),
      Padding(
        padding: EdgeInsets.only(left: 27.0),
        child: Column(
          children: [
            Row(
              children: [
                 Text(
                  "331".tr,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
               Spacer(),
                Text(
                  "${invoicesDetails.price}",maxLines: 2,
                  style: TextStyle(fontSize: 16,),
                ),
              ],
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                 Text(
                  "332".tr,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Text(
                  "${invoicesDetails.quantity}",maxLines: 2,
                  style: TextStyle(fontSize: 16,),
                ),
              ],
            ),
            SizedBox(height: 12,),
            // Row(
            //   children: [
            //     Text(
            //       "Medicine Quantity :",
            //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            //     ),
            //     SizedBox(width: 8,),
            //     Text(
            //       "${invoicesDetails.warehouseMedicine!.medicine!.}",
            //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            //     ),
            //   ],
            // ),
            Row(
              children: [
                Text(
                  "333".tr,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Text(
                  "${invoicesDetails.warehouseMedicine!.medicine!.descriptionEn}",
                  maxLines: 2,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                 Text(
                  "372".tr,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Text(
                  "${invoicesDetails.additional}",maxLines: 2,
                  style: TextStyle(fontSize: 16,),
                ),
              ],
            ),
            SizedBox(height: 12,),

            Row(
              children: [
                Text(
                  "334".tr,

                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Text(
                  "${invoicesDetails.warehouseMedicine!.medicine!.descriptionAr}",
                  maxLines: 2,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                Text(
                  "335".tr,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Text(
                  "${invoicesDetails.warehouseMedicine!.medicine!.commercialPrice}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                Text(
                  "336".tr,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Text(
                  "${invoicesDetails.warehouseMedicine!.medicine!.netPrice}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),

            SizedBox(height: 12,),


          ],
        ),
      ),

    ],
  );
}

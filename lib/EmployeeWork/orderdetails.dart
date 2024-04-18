import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/EmployeeWork/ModelDetails.dart';
import 'package:pharmacy/EmployeeWork/Success_Screen_Invoise.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';

import 'OrderWarehouseWork.dart';


class OrderDetailsWarehouseWork extends StatefulWidget {
  const OrderDetailsWarehouseWork({Key? key}) : super(key: key);

  @override
  State<OrderDetailsWarehouseWork> createState() => _OrderDetailsWarehouseWorkState();
}

class _OrderDetailsWarehouseWorkState extends State<OrderDetailsWarehouseWork> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
      listener: (context, state) {
        if(state is InvoiceWarehouseSuccessState){
          if(state.value==200){
            PharmacyHomeCubit.get(context).getOrderWarehouse(id:CacheHelper.getData(key: "idWEmployee"));

            navigateAndFinish(context: context,widget: SuccessScreenWork());


          }
        }
        if(state is InvoiceWarehouseErrorState){
          if(state.error==422){
           showToast(text: "The warehouse dispenser id field must not be greater than 1", state: ToastStates.EROOR);

          }else{
            showToast(text: "error", state: ToastStates.EROOR);

          }
        }
      },
      builder: (context, state) {
        PharmacyHomeCubit.get(context).getDDropDownItems();
        return Scaffold(
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
//               title: const Text("Order details",style: TextStyle( color: Colors.black87)),
//               leading:Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: IconButton(onPressed: () {
//                   navigateTo(context: context,widget: const OrderWarehouse());
//                 }, icon:const Icon(Icons.arrow_back,color: Colors.black87,)),
//               ),
//
//             ),
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
                      navigateAndFinish(context: context,widget:  OrderWarehouseWork());                    }, icon: Icon(Icons.arrow_back_ios_new_outlined,color:HexColor(green),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0,left: 34),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Pharmacy Name:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  color: Colors.grey.shade800
                              ),
                            ),
                            SizedBox(width: 2,),
                            Text("${CacheHelper.getData(key: "pharmacy_name_order_work")}",
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

                            Text(" ${CacheHelper.getData(key: "dateOrderWarehouse_work")}",
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
                            condition: state is !DetailsLoadingState,
                            builder: (context) => ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    buildOrderMedicineItem(PharmacyHomeCubit.get(context).details.orderDetails![index]),
                                separatorBuilder: (context, index) => MyLine(),
                                itemCount: PharmacyHomeCubit.get(context).details.orderDetails!.length),
                            fallback:(context) => Center(child: CircularProgressIndicator(color: HexColor(green))) ,
                          ),
                        ),
                      ],
                    ),
                  ),
                )));
      },
    );
  }

  Widget buildOrderMedicineItem(OrderDetails orderDetails) => InkWell(
    onTap: () {

    },
    child: Column(
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
            const Text(
              "Medicine Name :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              width: 8,
            ),
             Text(
              "${orderDetails.warehouseMedicine!.medicine!.tradeNameEn}",maxLines: 2,
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(
              width: 8,
            ),
             Text(
              "${orderDetails.warehouseMedicine!.medicine!.tradeNameAr}" ,maxLines: 2,
              style: TextStyle(fontSize: 14,),
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
                    "Medicine Quantity :",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: 8,),
                  Text(
                    "${orderDetails.warehouseMedicine!.maxQuantity}",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 12,),
              Row(
                children: [
                  Text(
                    "Commericl price :",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: 8,),
                  Text(
                    "${orderDetails.warehouseMedicine!.medicine!.commercialPrice}",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 12,),
              Row(
                children: [
                  Text(
                    "Net price :",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: 8,),
                  Text(
                    "${orderDetails.warehouseMedicine!.medicine!.netPrice}",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 12,),
              Row(
                children: [
                  Text(
                    "Quantity offer :",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: 8,),
                  Text(
                    "${orderDetails.offer!.demandQuantity}",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 12,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    " Free quantity :",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: 8,),
                  Text(
                    "${orderDetails.offer!.freeQuantity}",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 12,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Medicine load :",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      const Text(
                        "Medicine Name :",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${orderDetails.loadQuantity!.looad!.medicine!.tradeNameEn}",maxLines: 2,
                        style: TextStyle(fontSize: 14,),
                      ),
                      const SizedBox(
                        width: 8,
                      ),

                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    children: [

                      Text(
                        "Medicine Quantity :",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(width: 8,),
                      Text(
                        "${orderDetails.loadQuantity!.loadQuantity}",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      Text(
                        "Commericl price :",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(width: 8,),
                      Text(
                        "${orderDetails.loadQuantity!.looad!.medicine!.commercialPrice}",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      Text(
                        "Net price :",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(width: 8,),
                      Text(
                        "${orderDetails.loadQuantity!.looad!.medicine!.netPrice}",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),

                ],
              ),
              SizedBox(height: 12,),
              Row(
                children: [
                  Text("Choose the Dispensers :",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  SizedBox(width: 60,),
                  Padding(

                    padding: const EdgeInsets.only(left: 16),
                    child: DropdownButton<String>(
                      menuMaxHeight: 300,

                      icon:  Icon(Icons.arrow_drop_down_outlined,color:
                      HexColor(green.toString())),
                      iconSize: 20,
                      dropdownColor: HexColor("E5E4E2"),
                      underline: const SizedBox(),
                      value: PharmacyHomeCubit.get(context).selectedDispensers,
                      onChanged:(value) {
                        setState(() {
                          PharmacyHomeCubit.get(context).changeSelectedDispensers(value!);

                        });

                      },
                      items: PharmacyHomeCubit.get(context).dispensersDropDownItems,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24,),



            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            InkWell(
              onTap: () {//
                if(CacheHelper.getData(key: "stateinvWork")==1){
                  showToast(text:"the invoices has already been generated ", state: ToastStates.EROOR);
                }else{
            PharmacyHomeCubit.get(context).postCreateInvoice(
                date_of_invoice: CacheHelper.getData(key: "dateOrderWarehouse_work"),
                order_id: CacheHelper.getData(key: "order_id_Work"),
                );}
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
                  width: 120,
                  child: const Center(child: Text("create Invoices",style: TextStyle(color: Colors.white,fontSize: 14),)),

                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
  }


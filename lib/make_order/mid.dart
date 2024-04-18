import 'dart:async';
import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/make_order/Model.dart';
import 'package:pharmacy/make_order/chooseWarehouse.dart';
import 'package:pharmacy/make_order/next_screen.dart';
import 'package:pharmacy/make_order/showOrder.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';

class MedicineList extends StatefulWidget {
  MedicineList({Key? key}) : super(key: key);

  @override
  State<MedicineList> createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  var dataa = Get.arguments;
  List<bool> select = [];
  List<bool> selectload = [];

  // late int countVisibilityAdd;
  // List<bool> visibilityAdd=[];
  //   late int countVisibilityRemove;
  // List<bool>visibilityRemove=[];
  //  late int countNumberMedicine;
  // List<bool>checked=[];

  List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    // countNumberMedicine=PharmacyHomeCubit.get(context).allMedicine.warehouseMedicines!.length;
    // countVisibilityAdd=PharmacyHomeCubit.get(context).allMedicine.warehouseMedicines!.length;
    // countVisibilityRemove=PharmacyHomeCubit.get(context).allMedicine.warehouseMedicines!.length;
    PharmacyHomeCubit.get(context).showOrder = showOrder;
    PharmacyHomeCubit.get(context).dataMapMy = data;

    select = List.filled(200, false);
    selectload = List.filled(200, false);
    // visibilityAdd = List.filled(countVisibilityAdd, true);
    // visibilityRemove=List.filled(countVisibilityRemove, false);
    // checked=List.filled(countNumberMedicine, false);
    controllers = List.generate(
        PharmacyHomeCubit.get(context).countNumberMedicine,
        (index) => TextEditingController());
  }

  Map<dynamic, dynamic> data = {};
  List<Map<String, dynamic>> showOrder = [];

  late int indexOffers;
  late int indexOrder;
  late int freeQuantity;
  late int demandQuantity;
  late String medicineLoad;
  late int quantityLoad;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit, PharmacyHomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        PharmacyHomeCubit.get(context).dataMapMy = data;
        PharmacyHomeCubit.get(context).showOrder = showOrder;
        //
        // print( "countNumberMedicine${countNumberMedicine}");
        // print( "countVisibilityAdd${countVisibilityAdd}");
        // print( "countVisibilityAdd${countVisibilityRemove}");

        // print(checked.length);
        // print(visibilityRemove.length);
        // print(visibilityAdd.length);
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
//                 navigateTo(context: context,widget: Next());
//               }, icon:const Icon(Icons.arrow_back,color: Colors.black87,)),
//             ),
//             actions: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 24.0,top: 4),
//                 child: IconButton(onPressed:(){
//                   //navigateTo( context: context,widget: Search());
//                 }, icon: Icon(Icons.search_rounded,size: 30,color: HexColor(green),)),
//
//               )
//             ],
//           ),
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            toolbarHeight: 80,
            titleSpacing: 0.0,
            leadingWidth: 70,
            elevation: 0.0,
            actions: [
              // Padding(
              //   padding: const EdgeInsets.only(right: 24.0, top: 4,left: 24),
              //   child: IconButton(
              //       onPressed: () {
              //         //navigateTo( context: context,widget: Search());
              //       },
              //       icon: Icon(
              //         Icons.search_rounded,
              //         size: 30,
              //         color: HexColor(green),
              //       )),
              // )
            ],
            flexibleSpace: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            backgroundColor: Colors.white.withAlpha(100),
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90.0),
              child: Text("343".tr,
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16, color: Colors.black,
                  )),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    navigateAndFinish(context: context, widget: WarehouseMakeOrder());
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: HexColor(green),
                  )),
            ),
          ),
          body: Container(
            height: double.infinity,
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
              child: Container(
                height: 1000000,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return buildOrderItem(
                            context,
                            index,
                            PharmacyHomeCubit.get(context)
                                .allMedicine
                                .warehouseMedicines![index]);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: PharmacyHomeCubit.get(context)
                          .allMedicine
                          .warehouseMedicines!
                          .length),
                ),
              ),
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              splashColor: HexColor(green.toString()),
              onPressed: () {
                print(showOrder.length);

                //  PharmacyHomeCubit.get(context).createOrder(dataMap:data, time: dataa[0]);
                Get.to(() => Order(),
                    arguments: [CacheHelper.getData(key: "_dateController")]);
              },
              child: Text("344".tr,
                  style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndFloat,
        );
      },
    );
  }

  Widget buildOrderItem(
          context, index, WarehouseMedicines warehouseMedicines) =>
      Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Container(
            // height: MediaQuery.of(context).size.height*0.2,
            width: double.infinity,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(0.3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
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
                                Text(
                                    "${warehouseMedicines.medicine!.tradeNameEn}",
                                    style: TextStyle(fontSize: 20)),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                    "${warehouseMedicines.medicine!.tradeNameAr}",
                                    style: TextStyle(fontSize: 16)),
                                const Spacer(),
                                Checkbox(
                                    activeColor: HexColor(green.toString()),
                                    value: PharmacyHomeCubit.get(context)
                                        .checked[index],
                                    onChanged: (value) {
                                      //true ,false
                                      setState(() {
                                        // checked[index] =  !checked[index] ;
                                        PharmacyHomeCubit.get(context)
                                            .changeChecked(index);
                                        //  print(checked);
                                      });
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text("345".tr, style: TextStyle(fontSize: 16)),
                                Spacer(),
                                Text(
                                    "${warehouseMedicines.medicine!.company!.nameEn}",
                                    style: TextStyle(fontSize: 14)),

                                Text(
                                    "${warehouseMedicines.medicine!.company!.nameAr}",
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Visibility(
                              visible:
                                  PharmacyHomeCubit.get(context).checked[index],
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          "${"346".tr}"),
Spacer(),
                                      Text(
                                          "${warehouseMedicines.medicine!.netPrice} "),

                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          "${"347".tr} "),
                                      Spacer(),
                                      Text(
                                          "${warehouseMedicines.medicine!.commercialPrice} "),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          "${"348".tr}"),
                                      Spacer(),
                                      Text(
                                          "${warehouseMedicines.maxQuantity} "),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text("349".tr),
                                      const Spacer(),
                                      Container(
                                        height: 30,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35)),
                                            color:
                                                Colors.white.withOpacity(0.3)),
                                        child: defaultTextFieldPharmacyAmount(
                                            controller: controllers[index],
                                            type: TextInputType.text,
                                            validate: (validate) {},
                                            prefix: Icons.text_fields,
                                            hint: "349".tr),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text("350".tr),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  ConditionalBuilder(
                                    condition:
                                        warehouseMedicines.offer!.isNotEmpty,
                                    builder: (context) => Container(
                                      height: 100,
                                      child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index1) =>
                                              buildOrderItem1(
                                                  index1,
                                                  index,
                                                  warehouseMedicines
                                                      .offer![index1]),
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(
                                                width: 10,
                                              ),
                                          itemCount:
                                              warehouseMedicines.offer!.length),
                                    ),
                                    fallback: (context) => Center(
                                        child: Text(
                                      "There are no loads",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    )),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                   Text("359".tr),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  ConditionalBuilder(
                                    condition: warehouseMedicines
                                        .warehousemedicinesload!.isNotEmpty,
                                    builder: (context) => Container(
                                      height: 100,
                                      child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index2) =>
                                              buildOrderItem2(
                                                  index2,
                                                  index,
                                                  warehouseMedicines
                                                          .warehousemedicinesload![
                                                      index2]),
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(
                                                width: 10,
                                              ),
                                          itemCount: warehouseMedicines
                                              .warehousemedicinesload!.length),
                                    ),
                                    fallback: (context) => Center(
                                        child: Text(
                                      "There are no loads",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    )),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Visibility(
                                        visible: PharmacyHomeCubit.get(context)
                                            .visibilityAdd[index],
                                        child: newDefaulDashbordtButton(
                                            function: () {
                                              if (double.parse(
                                                      controllers[index].text) >
                                                  warehouseMedicines
                                                      .maxQuantity!
                                                      .toInt()) {
                                                showToast(
                                                    text:
                                                        "the quantity you entered is greater than th"
                                                        "e available quantity",
                                                    state: ToastStates.EROOR);
                                              }
                                              if (demandQuantity >
                                                  warehouseMedicines
                                                      .maxQuantity!
                                                      .toInt()) {
                                                showToast(
                                                    text:
                                                        "the offer demandQuantity you entered is greater than th"
                                                        "e available quantity",
                                                    state: ToastStates.EROOR);
                                              }
                                              if (demandQuantity >
                                                  warehouseMedicines
                                                      .maxQuantity!
                                                      .toInt()) {
                                                showToast(
                                                    text:
                                                        "the offer demandQuantity you entered is greater than th"
                                                        "e available quantity",
                                                    state: ToastStates.EROOR);
                                              } else {
                                                data.addAll({
                                                  warehouseMedicines
                                                      .medicine!.id
                                                      .toString(): {
                                                    "quantity":
                                                        controllers[index].text,
                                                    "offer_id": indexOffers,
                                                    "load_id": indexOrder
                                                  }
                                                });
                                                showOrder.addAll([
                                                  {
                                                    "medicine_en":
                                                        warehouseMedicines
                                                            .medicine!
                                                            .tradeNameEn,
                                                    "medicine_an":
                                                        warehouseMedicines
                                                            .medicine!
                                                            .tradeNameAr,
                                                    "net_price":
                                                        warehouseMedicines
                                                            .medicine!.netPrice,
                                                    "commercial_price":
                                                        warehouseMedicines
                                                            .medicine!
                                                            .commercialPrice,
                                                    "quantity":
                                                        controllers[index].text,
                                                    "offer_id": indexOffers,
                                                    "load_id": indexOrder,
                                                    "freeQuantity":
                                                        freeQuantity,
                                                    "demandQuantity":
                                                        demandQuantity,
                                                    "medicineLoad":
                                                        medicineLoad,
                                                    "quantityLoad": quantityLoad
                                                  }
                                                ]);
                                                indexOffers = 0;
                                                indexOrder = 0;
                                                showToast(
                                                    text: "Add Successfully",
                                                    state: ToastStates.EROOR);

                                                setState(() {
                                                  PharmacyHomeCubit.get(context)
                                                      .changeVisibilityAdd(
                                                          index);
                                                  PharmacyHomeCubit.get(context)
                                                      .changeVisibilityRemove(
                                                          index);

                                                  // visibilityAdd[index]=!visibilityAdd[index];
                                                  // visibilityRemove[index]=!visibilityRemove[index];
                                                });
                                              }

                                              print(data);
                                            },
                                            text: "373".tr,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8),
                                      ),
                                      Visibility(
                                        visible: PharmacyHomeCubit.get(context)
                                            .visibilityRemove[index],
                                        child: newDefaulDashbordtButton(
                                            function: () {
                                              data.remove(index);
                                              showOrder.remove(index);

                                              setState(() {
                                                PharmacyHomeCubit.get(context)
                                                    .changeVisibilityAdd(index);
                                                PharmacyHomeCubit.get(context)
                                                    .changeVisibilityRemove(
                                                        index);
                                                PharmacyHomeCubit.get(context)
                                                    .changeChecked(index);
                                              });
                                              // visibilityAdd[index]=!visibilityAdd[index];
                                              // visibilityRemove[index]=!visibilityRemove[index];
                                              controllers[index].clear();

                                              indexOrder = 0;
                                              indexOffers = 0;
                                            },
                                            text: "374".tr,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8),
                                      ),
                                    ],
                                  )
                                ],
                              ),
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
          // InkWell(
          //   onTap: () {
          //
          //   },
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color:HexColor(green.toString()),
          //
          //       borderRadius: const BorderRadius.only(
          //           bottomLeft: Radius.circular(16),
          //           topRight: Radius.circular(16)
          //       ),
          //     ),
          //     height: 30,
          //     width: 150,
          //     child: const Center(
          //       child: Text("add",style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 12
          //       )),
          //     ),
          //
          //   ),
          // ),
        ],
      );

//               number offers    number medicine
  Widget buildOrderItem1(index, n, Offer offer) => InkWell(
        onTap: () {
          setState(() {
            select[index] = !select[index];
            indexOffers = offer.id!;
            freeQuantity = offer.freeQuantity!;
            demandQuantity = offer.demandQuantity!;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: select[index] == false
                ? Colors.white.withOpacity(0.5)
                : Colors.white.withOpacity(0.3),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${"351".tr}${offer.demandQuantity}",
                        style: TextStyle(fontSize: 12)),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "${"352".tr}${offer.freeQuantity}",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildOrderItem2(
          index, n, Warehousemedicinesload warehousemedicinesload) =>
      InkWell(
        onTap: () {
          setState(() {
            selectload[index] = !selectload[index];
            indexOrder = warehousemedicinesload.id!;
            quantityLoad = warehousemedicinesload.loadQuantity!;
            medicineLoad = warehousemedicinesload.looad!.medicine!.tradeNameEn!;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: selectload[index] == false
                ? Colors.white.withOpacity(0.5)
                : Colors.white.withOpacity(0.3),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                            "${"353".tr}${warehousemedicinesload.looad!.medicine!.tradeNameEn}",
                            style: TextStyle(fontSize: 12)),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                            "${warehousemedicinesload.looad!.medicine!.tradeNameAr}",
                            style: TextStyle(fontSize: 10)),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "${"349".tr}${warehousemedicinesload.loadQuantity}",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
      );
}

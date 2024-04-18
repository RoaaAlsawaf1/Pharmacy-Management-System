import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/make_order/button_screen.dart';
import 'package:pharmacy/make_order/mid.dart';
import 'package:pharmacy/make_order/next_screen.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';

class WarehouseMakeOrder extends StatefulWidget {
  WarehouseMakeOrder({Key? key}) : super(key: key);

  @override
  State<WarehouseMakeOrder> createState() => _WarehouseMakeOrderState();
}

class _WarehouseMakeOrderState extends State<WarehouseMakeOrder> {
  var WarehouseNameController = TextEditingController();

  // var data=Get.arguments;
  TextEditingController _dateController = TextEditingController();

  TextEditingController _timeController = TextEditingController();

  DateFormat _dateFormat = DateFormat('yyyy/M/d');

  DateFormat _timeFormat = DateFormat.Hm();

  @override
  Widget build(BuildContext context) {
    _dateController.text = _dateFormat.format(DateTime.now());
    _timeController.text = _timeFormat.format(DateTime.now());

    return BlocConsumer<PharmacyHomeCubit, PharmacyHomeStates>(
      listener: (context, state) {
        if (state is GetWarehouseMedicineAndOffersSuccessState) {
          if (state.value == 200) {
            CacheHelper.saveData(
                key: "_dateController", value: _dateController.text);
            if(PharmacyHomeCubit.get(context).allMedicine.warehouseMedicines!.isEmpty){
              showToast(text:"Medicine not found", state: ToastStates.EROOR);
            }
            else{
              Get.to(() => MedicineList(), arguments: [
                CacheHelper.getData(key: "_dateController")

              ]);
            }

          }
        }
      },
      builder: (context, state) {
        PharmacyHomeCubit.get(context).getWarehouseDropDownItems();
        PharmacyHomeCubit.get(context).idPharmacyOrder =
            CacheHelper.getData(key: "idPharmacy");
        return Scaffold(

          extendBodyBehindAppBar: true,
          appBar: AppBar(
            toolbarHeight: 80,
            titleSpacing: 0.0,
            leadingWidth: 70,
            elevation: 0.0,
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
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Text("312".tr,
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16, color: Colors.black,
                  )),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    navigateAndFinish(widget: Button(), context: context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: HexColor(green),
                  )),
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
                padding: const EdgeInsets.only(left: 24, right: 24, top: 150),
                child: Container(
                  height: 900,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 32,right: 8),
                        child: Text("313".tr,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16)),
                      ),
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                            color: Colors.white.withOpacity(0.3)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16,right: 16),
                          child: Row(
                            children: [
                              Icon(
                                Icons.warehouse_outlined,
                                color: HexColor(green.toString()),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: DropdownButton<String>(
                                  menuMaxHeight: 300,
                                  icon: Icon(Icons.arrow_drop_down_outlined,
                                      color: HexColor(green.toString())),
                                  iconSize: 20,
                                  dropdownColor: HexColor("E5E4E2"),
                                  underline: const SizedBox(),
                                  value: PharmacyHomeCubit.get(context)
                                      .selectedWarehouse,
                                  onChanged: (value) {
                                    setState(() {
                                      PharmacyHomeCubit.get(context)
                                          .changeSelectedWarehouse(value!);
                                    });
                                  },
                                  items: PharmacyHomeCubit.get(context)
                                      .warehouseDropDownItems,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8),
                        child: Text("314".tr,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          color: Colors.white.withOpacity(0.3),
                        ),
                        child: defaultTextFieldPharmacyDashboard2(
                            controller: _dateController,
                            type: TextInputType.text,
                            hint: "Enter Order Date please ",
                            validate: (value) {
                              if (value.isEmpty) {
                                return "Your Order Date must not be empty";
                              } else {
                                return null;
                              }
                            },
                            prefix: Icons.date_range_outlined),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 270),
                        child: newDefaultButton(
                            background: HexColor(green),
                            text: "315".tr,

                            //  background: HexColor(green.toString()),
                            function: () {
                              PharmacyHomeCubit.get(context)
                                  .getWarehouseMedicineAndOffers(
                                      id: PharmacyHomeCubit.get(context)
                                          .selectedWarehouseId);
                            },
                            width: double.infinity,
                            isAppbar: false),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

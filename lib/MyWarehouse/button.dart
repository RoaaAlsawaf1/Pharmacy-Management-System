import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/MyPharmacy/my_pharmacy.dart';
import 'package:pharmacy/MyWarehouse/button_Ware.dart';
import 'package:pharmacy/MyWarehouse/my_warehous.dart';
import 'package:pharmacy/make_order/SearchM.dart';
import 'package:pharmacy/make_order/chooseWarehouse.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';
import 'package:pharmacy/update_information_medicine/Search.dart';

class ButtonWarehouse extends StatefulWidget {
  ButtonWarehouse({Key? key}) : super(key: key);

  @override
  State<ButtonWarehouse> createState() => _ButtonWarehouseState();
}

class _ButtonWarehouseState extends State<ButtonWarehouse> {
  var data = Get.arguments;
  var employeeController = TextEditingController();
  var dispenserController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit, PharmacyHomeStates>(
      listener: (context, state) {
        if (state is WarehouseAddDisSuccessState) //نجاح او فشل التسجيل
        {
          if (state.value == 200) {
            showToast(
                text: "Dispenser has been created.", state: ToastStates.EROOR);
            dispenserController.clear();
          }
        }
        if (state is WarehouseAddDisErrorState) {
          if (state.error == 422) {
            showToast(
                text: "The selected dispenser email is invalid.",
                state: ToastStates.EROOR);
          }
        }
        if (state is WarehouseAddEmpSuccessState) //نجاح او فشل التسجيل
        {
          if (state.value == 200) {
            showToast(
                text: "Employee has been created.", state: ToastStates.SUCCESS);
            employeeController.clear();
          }
        }
        if (state is WarehouseAddEmpErrorState) {
          if (state.error == 422) {
            showToast(
                text: "The selected employee email is invalid.",
                state: ToastStates.EROOR);
          }
        }
      },
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
              padding: EdgeInsets.symmetric(horizontal: 80.0),
              child: Text("362".tr,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.grey.shade800,
                  )),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    navigateAndFinish(context: context, widget: ButtonWare());
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: HexColor(green),
                  )),
            ),
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
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
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 150),
                child: Container(
                  height: 1000,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      //  LottieBuilder.asset("images/animation_ll19xw4u.json"),
                      Text("363".tr,
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(35),
                                    bottomLeft: Radius.circular(35)),
                                color: Colors.white.withOpacity(0.3),
                              ),
                              child: defaultTextFieldPharmacyDashboard(
                                  controller: employeeController,
                                  type: TextInputType.emailAddress,
                                  validate: (value) {},
                                  prefix: Icons.email,
                                  hint: "202".tr),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor(green.toString()),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(35),
                                    bottomRight: Radius.circular(35)),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    HexColor('56949a'),
                                    HexColor('3e8489'),
                                  ],
                                ),
                              ),
                              child: MaterialButton(
                                  splashColor: HexColor(green.toString()),
                                  onPressed: () {
                                    PharmacyHomeCubit.get(context)
                                        .addemployeetowarehouse(
                                            employeeemail:
                                                employeeController.text);
                                  },
                                  child: Text("364".tr,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      ConditionalBuilder(
                        builder: (context) => MyLine(),
                        fallback: (context) => LinearProgressIndicator(
                          color: HexColor(green.toString()),
                          minHeight: 2,
                        ),
                        condition: state is! WarehouseAddEmpLoadingState,
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      Text("363".tr,
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(35),
                                    bottomLeft: Radius.circular(35)),
                                color: Colors.white.withOpacity(0.3),
                              ),
                              child: defaultTextFieldPharmacyDashboard(
                                controller: dispenserController,
                                type: TextInputType.emailAddress,
                                validate: (value) {},
                                prefix: Icons.email,
                                hint: "201".tr,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor(green.toString()),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(35),
                                    bottomRight: Radius.circular(35)),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    HexColor('56949a'),
                                    HexColor('3e8489'),
                                  ],
                                ),
                              ),
                              child: MaterialButton(
                                  splashColor: HexColor(green.toString()),
                                  onPressed: () {
                                    PharmacyHomeCubit.get(context)
                                        .adddispensertowarehouse(
                                            dispensereemail:
                                                dispenserController.text);
                                  },
                                  child: Text(
                                    "364".tr,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      ConditionalBuilder(
                        builder: (context) => MyLine(),
                        fallback: (context) => LinearProgressIndicator(
                          color: HexColor(green.toString()),
                          minHeight: 2,
                        ),
                        condition: state is! WarehouseAddDisLoadingState,
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

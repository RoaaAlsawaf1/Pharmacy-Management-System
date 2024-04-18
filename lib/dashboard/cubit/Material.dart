import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/dashboard/responsive.dart';
import 'package:pharmacy/dashboard/size_config.dart';
import 'package:pharmacy/dashboard/style.dart';

import '../../Home/cubit/cubit.dart';
import '../../shared/components/components.dart';

class MaterailScreen extends StatelessWidget {
   MaterailScreen({Key? key}) : super(key: key);
  var materialController=TextEditingController();
  var companyController=TextEditingController();
  var materialArController=TextEditingController();
  var companyArController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
      listener: (context, state) {
        if(state is MSuccessDataState){
          if(state.value==200){
            showToast(text: "active material has been created", state:ToastStates.EROOR);
            materialArController.clear();
            materialController.clear();
          }
        }if(state is MErrorDataState) {

          if(state.error==400){
            showToast(text: "invalid name", state:ToastStates.EROOR);

          }
          else{
            showToast(text: "error", state:ToastStates.EROOR);

          }

        }

        if(state is CSuccessDataState){
          if(state.value==200){
            showToast(text: "Company has been created", state:ToastStates.EROOR);
            companyArController.clear();
            companyController.clear();
          }
        }if(state is CErrorDataState) {
          if(state.error==400){
            showToast(text: "invalid name", state:ToastStates.EROOR);

          }
          else{
            showToast(text: "error", state:ToastStates.EROOR);

          }

        }
      },
      builder: (context, state) {
        return  Scaffold(
          body: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin:
                  Alignment.topRight,
                  end: Alignment
                      .bottomLeft,
                  colors: [
                    HexColor('A8BEE7'),
                    HexColor('AEC9DE'),
                    //gray light
                    //gray dark
                    HexColor('BBC5CE'),
                    HexColor('BDB9C7'),
                    //
                    HexColor('D3C8CC'),
                    HexColor('D3CACF'),
                    HexColor('DBD9DE'),
                    HexColor('D7D2D8'),
                  ],
                  tileMode:
                  TileMode.clamp,
                ),
              ),
              child:
              SingleChildScrollView(
                physics:
                const BouncingScrollPhysics(),
                child: Padding(
                  padding:
                  const EdgeInsets
                      .all(32.0),
                  child:
                  ConditionalBuilder(
                    condition: Responsive
                        .isDesktop(
                        context),
                    builder: (context) =>
                        Padding(
                          padding:
                          const EdgeInsets
                              .all(100.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      const PrimaryText(
                                          text:
                                          'Add some information',
                                          size:
                                          20,
                                          fontWeight:
                                          FontWeight.w800),
                                      SizedBox(
                                        height:
                                        SizeConfig.blockSizeVertical! * 4,
                                      ),
                                      const PrimaryText(
                                          text:
                                          '  active material',
                                          size:
                                          16,
                                          fontWeight:
                                          FontWeight.w800),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig
                                    .blockSizeVertical! *
                                    2,
                              ),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all( Radius.circular(35)),
                                      color: Colors.white.withOpacity(0.3),),

                                    child:
                                    defaultTextFieldPharmacyDashboard2(
                                      controller:
                                      materialController,
                                      type: TextInputType
                                          .text,
                                      validate:
                                          (value) {},
                                      prefix:
                                      Icons.text_fields,
                                      hint:
                                      "name_en",
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                    SizeConfig.blockSizeVertical! *
                                        2,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all( Radius.circular(35)),
                                      color: Colors.white.withOpacity(0.3),),
                                    child:
                                    defaultTextFieldPharmacyDashboard2(
                                      controller:
                                      materialArController,
                                      type: TextInputType
                                          .text,
                                      validate:
                                          (value) {},
                                      prefix:
                                      Icons.text_fields,
                                      hint:
                                      "name_ar",
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                    SizeConfig.blockSizeVertical! *
                                        2,
                                  ),
                                  newDefaultButton3(
                                    function:
                                        () {
                                      PharmacyHomeCubit.get(context).addMaterial(
                                          name_en:
                                          materialController.text,
                                          name_ar: materialArController.text);
                                    },
                                    text:
                                    "Add",
                                  ),
                                ],
                              ),
                              ////////////////////////////////////////////////////////////Add inform
                              SizedBox(
                                height: SizeConfig
                                    .blockSizeVertical! *
                                    2,
                              ),
                              const Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      PrimaryText(
                                          text:
                                          '  Company',
                                          size:
                                          16,
                                          fontWeight:
                                          FontWeight.w800),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig
                                    .blockSizeVertical! *
                                    2,
                              ),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all( Radius.circular(35)),
                                      color: Colors.white.withOpacity(0.3),),
                                    child:
                                    defaultTextFieldPharmacyDashboard2(
                                      controller:
                                      companyController,
                                      type: TextInputType
                                          .text,
                                      validate:
                                          (value) {},
                                      prefix:
                                      Icons.text_fields,
                                      hint:
                                      "name_en",
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                    SizeConfig.blockSizeVertical! *
                                        2,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all( Radius.circular(35)),
                                      color: Colors.white.withOpacity(0.3),),
                                    child:
                                    defaultTextFieldPharmacyDashboard2(
                                      controller:
                                      companyArController,
                                      type: TextInputType
                                          .text,
                                      validate:
                                          (value) {},
                                      prefix:
                                      Icons.text_fields,
                                      hint:
                                      "name_ar",
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                    SizeConfig.blockSizeVertical! *
                                        2,
                                  ),
                                  newDefaultButton3(
                                    function:
                                        () {
                                      PharmacyHomeCubit.get(context).addCompany(
                                          name_en:
                                          companyController.text,
                                          name_ar: companyArController.text);
                                    },
                                    text:
                                    "Add",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    fallback: (context) =>
                        Padding(
                          padding:
                          const EdgeInsets
                              .only(
                              top: 100.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      const PrimaryText(
                                          text:
                                          'Add some information',
                                          size:
                                          20,
                                          fontWeight:
                                          FontWeight.w800),
                                      SizedBox(
                                        height:
                                        SizeConfig.blockSizeVertical! * 3,
                                      ),
                                      const PrimaryText(
                                          text:
                                          '  active material',
                                          size:
                                          16,
                                          fontWeight:
                                          FontWeight.w800),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig
                                    .blockSizeVertical! *
                                    2,
                              ),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all( Radius.circular(35)),
                                      color: Colors.white.withOpacity(0.3),),
                                    width: MediaQuery.of(context)
                                        .size
                                        .width *
                                        3,
                                    child:
                                    defaultTextFieldPharmacyDashboard2(
                                      controller:
                                      materialController,
                                      type: TextInputType
                                          .text,
                                      validate:
                                          (value) {},
                                      prefix:
                                      Icons.text_fields,
                                      hint:
                                      "name_en",
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                    SizeConfig.blockSizeVertical! *
                                        2,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all( Radius.circular(35)),
                                      color: Colors.white.withOpacity(0.3),),
                                    child:
                                    defaultTextFieldPharmacyDashboard2(
                                      controller:
                                      materialArController,
                                      type: TextInputType
                                          .text,
                                      validate:
                                          (value) {},
                                      prefix:
                                      Icons.text_fields,
                                      hint:
                                      "name_ar",
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                    SizeConfig.blockSizeVertical! *
                                        2,
                                  ),
                                  newDefaultButton3(
                                    function:
                                        () {
                                      PharmacyHomeCubit.get(context).addMaterial(
                                          name_en:
                                          materialController.text,
                                          name_ar: materialArController.text);
                                    },
                                    text:
                                    "Add",
                                  ),
                                ],
                              ),
                              ////////////////////////////////////////////////////////////Add inform
                              SizedBox(
                                height: SizeConfig
                                    .blockSizeVertical! *
                                    2,
                              ),
                              const Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      PrimaryText(
                                          text:
                                          '  Company',
                                          size:
                                          16,
                                          fontWeight:
                                          FontWeight.w800),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig
                                    .blockSizeVertical! *
                                    2,
                              ),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all( Radius.circular(35)),
                                      color: Colors.white.withOpacity(0.3),),
                                    child:
                                    defaultTextFieldPharmacyDashboard2(
                                      controller:
                                      companyController,
                                      type: TextInputType
                                          .text,
                                      validate:
                                          (value) {},
                                      prefix:
                                      Icons.text_fields,
                                      hint:
                                      "name_en",
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                    SizeConfig.blockSizeVertical! *
                                        2,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all( Radius.circular(35)),
                                      color: Colors.white.withOpacity(0.3),),
                                    child:
                                    defaultTextFieldPharmacyDashboard2(
                                      controller:
                                      companyArController,
                                      type: TextInputType
                                          .text,
                                      validate:
                                          (value) {},
                                      prefix:
                                      Icons.text_fields,
                                      hint:
                                      "name_ar",
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                    SizeConfig.blockSizeVertical! *
                                        2,
                                  ),
                                  newDefaultButton3(
                                    function:
                                        () {
                                      PharmacyHomeCubit.get(context).addCompany(
                                          name_en:
                                          companyController.text,
                                          name_ar: companyArController.text);
                                    },
                                    text:
                                    "Add",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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

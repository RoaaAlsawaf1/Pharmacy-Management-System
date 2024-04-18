import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/dashboard/cubit/medicine_barcode_createMedicine.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constant.dart';
import '../Success_Screen_dashbord.dart';

class CreateMedicine extends StatefulWidget {
   CreateMedicine({Key? key}) : super(key: key);


  @override
  State<CreateMedicine> createState() => _CreateMedicineState();
}

class _CreateMedicineState extends State<CreateMedicine> {
  bool visibel=false;
  bool visibel1=false;
  var medicineNameEnController = TextEditingController();

  var medicineNameArController = TextEditingController();

  var medicineDescriptionEnController = TextEditingController();

  var medicineDescriptionArController = TextEditingController();

  var medicineFormEnController = TextEditingController();

  var medicineFormArController = TextEditingController();

  var medicineComPriceController = TextEditingController();

  var medicineNetPriceController = TextEditingController();

  var medicineSizeController = TextEditingController();

  var medicinePartController = TextEditingController();

  var medicineCompanyController = TextEditingController();
  var active_mat_arController1 = TextEditingController();
  var active_mat_enController1 = TextEditingController();
  var concentrationController1 = TextEditingController();
  var active_mat_arController2 = TextEditingController();
  var active_mat_enController2 = TextEditingController();
  var concentrationController2 = TextEditingController();
  var active_mat_arController3 = TextEditingController();
  var active_mat_enController3 = TextEditingController();
  var concentrationController3 = TextEditingController();

  File? image;
  String? imageFile;
  // List<TextEditingController> listController = [TextEditingController()];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
      listener: (context, state) {
        if(state is CreateMedicineWarehouseAddDisSuccessState){
          if(state.value==200){
            navigateAndFinish(context: context,widget: SuccessScreen());

          }
        }
        if(state is CreateMedicineWarehouseAddDisErrorState){
         showToast(text: "error", state: ToastStates.EROOR);
      }
      },
      builder: (context, state) {
        return Scaffold(

            body: Container(
                height: MediaQuery.of(
                    context)
                    .size
                    .height,
                width: MediaQuery.of(
                    context)
                    .size
                    .width,
                decoration:
                BoxDecoration(
                  gradient:
                  LinearGradient(
                    begin: Alignment
                        .topRight,
                    end: Alignment
                        .bottomLeft,
                    colors: [
                      HexColor(
                          'A8BEE7'),
                      HexColor(
                          'AEC9DE'),
                      //gray light
                      //gray dark
                      HexColor(
                          'BBC5CE'),
                      HexColor(
                          'BDB9C7'),
                      //
                      HexColor(
                          'D3C8CC'),
                      HexColor(
                          'D3CACF'),
                      HexColor(
                          'DBD9DE'),
                      HexColor(
                          'D7D2D8'),
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
                        .only(left: 24.0,right: 24,top:100),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      mainAxisAlignment:
                      MainAxisAlignment
                          .start,
                      children: [
                        const Padding(
                          padding: EdgeInsets
                              .only(
                              left:
                              16.0),
                          child: Text(
                            "Read Barcode for Medicine",
                            style: TextStyle(
                                fontWeight:
                                FontWeight
                                    .w500,
                                fontSize:
                                18),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        // InkWell(
                        //   onTap: () {
                        //    navigateTo(widget: Medicine_Read_BarCode(),context: context);
                        //
                        //   },
                        //   child: Container(
                        //     width:double.infinity,
                        //     height: 45,
                        //     decoration: BoxDecoration(
                        //       borderRadius: const BorderRadius.all(Radius.circular(30)),
                        //       color:Colors.white.withOpacity(0.2)
                        //       ,
                        //     ),
                        //     child: Row(
                        //       children: [
                        //         const SizedBox(width:16 ,),
                        //         Icon(Icons.barcode_reader,color: HexColor(green.toString()),
                        //         ),
                        //         const SizedBox(width:8 ,),
                        //         Text("barode",style: TextStyle(
                        //             color: HexColor("6C6D72"),
                        //             fontSize: 14
                        //         ),),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Padding(
                          padding: EdgeInsets
                              .only(
                              left:
                              16.0),
                          child: Text(
                            "Add Medication Name",
                            style: TextStyle(
                                fontWeight:
                                FontWeight
                                    .w500,
                                fontSize:
                                18),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(35)),
                            color: Colors.white.withOpacity(0.3),),
                          child: defaultTextFieldPharmacy3(
                              controller:
                              medicineNameEnController,
                              prefix: Icons
                                  .medical_information_outlined,
                              hint:
                              "Medication Name in en",
                              type: TextInputType
                                  .name,
                              validate:
                                  (value) {
                                if (value
                                    .isEmpty) {
                                  return "Your email must not be empty";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(35)),
                            color: Colors.white.withOpacity(0.3),),
                          child: defaultTextFieldPharmacy3(
                              controller:
                              medicineNameArController,
                              prefix: Icons
                                  .medical_information_outlined,
                              hint:
                              "Medication Name in ar",
                              type: TextInputType
                                  .name,
                              validate:
                                  (value) {
                                if (value
                                    .isEmpty) {
                                  return "Your email must not be empty";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Padding(
                          padding: EdgeInsets
                              .only(
                              left:
                              16.0),
                          child: Text(
                            "Add Image",
                            style: TextStyle(
                                fontWeight:
                                FontWeight
                                    .w500,
                                fontSize:
                                18),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: ((builder) => Container(child: bottomSheet(context))),
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                ),
                              ),

                            );

                          },
                          child: Container(
                            width:double.infinity,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(30)),
                              color:Colors.white.withOpacity(0.2)
                              ,
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width:16 ,),
                                Icon(Icons.picture_in_picture_alt_outlined,color: HexColor(green.toString()),
                                ),
                                const SizedBox(width:8 ,),
                                Text("Image Medicine",style: TextStyle(
                                    color: HexColor("6C6D72"),
                                    fontSize: 14
                                ),),
                                const Spacer(),
                                ConditionalBuilder(
                                  builder:(context) =>ClipRRect(
                                      borderRadius:BorderRadius.circular(12) ,
                                      child: Image(image:FileImage(image!) as ImageProvider,
                                        color: Colors.white.withOpacity(0.4),colorBlendMode: BlendMode.dstATop,
                                        width: 90,

                                      )) ,
                                  fallback:(context) => const Spacer()
                                  ,
                                  condition:image != null ,
                                ),

                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Padding(
                          padding: EdgeInsets
                              .only(
                              left:
                              16.0),
                          child: Text(
                            "Add description ",
                            style: TextStyle(
                                fontWeight:
                                FontWeight
                                    .w500,
                                fontSize:
                                18),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(35)),
                            color: Colors.white.withOpacity(0.3),),
                          child: defaultTextFieldPharmacy3(
                              controller:
                              medicineDescriptionEnController,
                              prefix: Icons
                                  .description_outlined,
                              hint:
                              "Medication description in en",
                              type: TextInputType
                                  .name,
                              validate:
                                  (value) {
                                if (value
                                    .isEmpty) {
                                  return "Your email must not be empty";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(35)),
                            color: Colors.white.withOpacity(0.3),),
                          child: defaultTextFieldPharmacy3(
                              controller:
                              medicineDescriptionArController,
                              prefix: Icons
                                  .description_outlined,
                              hint:
                              "Medication description in ar",
                              type: TextInputType
                                  .name,
                              validate:
                                  (value) {
                                if (value
                                    .isEmpty) {
                                  return "Your email must not be empty";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Padding(
                          padding: EdgeInsets
                              .only(
                              left:
                              16.0),
                          child: Text(
                            "Add Medication form",
                            style: TextStyle(
                                fontWeight:
                                FontWeight
                                    .w500,
                                fontSize:
                                18),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(35)),
                            color: Colors.white.withOpacity(0.3),),
                          child: defaultTextFieldPharmacy3(
                              controller:
                              medicineFormEnController,
                              prefix: Icons
                                  .medical_information_outlined,
                              hint:
                              "Medication form in en",
                              type: TextInputType
                                  .name,
                              validate:
                                  (value) {
                                if (value
                                    .isEmpty) {
                                  return "Your Medication form must not be empty";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(35)),
                            color: Colors.white.withOpacity(0.3),),
                          child: defaultTextFieldPharmacy3(
                              controller:
                              medicineFormArController,
                              prefix: Icons
                                  .medical_information_outlined,
                              hint:
                              "Medication form in ar",
                              type: TextInputType
                                  .name,
                              validate:
                                  (value) {
                                if (value
                                    .isEmpty) {
                                  return "Your Medication form must not be empty";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Padding(
                          padding: EdgeInsets
                              .only(
                              left:
                              16.0),
                          child: Text(
                            "Add commercial Price",
                            style: TextStyle(
                                fontWeight:
                                FontWeight
                                    .w500,
                                fontSize:
                                18),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(35)),
                            color: Colors.white.withOpacity(0.3),),
                          child: defaultTextFieldPharmacy3(
                              controller:
                              medicineComPriceController,
                              prefix: Icons
                                  .price_change_outlined,
                              hint:
                              "commercial Price  ",
                              type: TextInputType
                                  .name,
                              validate:
                                  (value) {
                                if (value
                                    .isEmpty) {
                                  return "Your commercial Price must not be empty";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Padding(
                          padding: EdgeInsets
                              .only(
                              left:
                              16.0),
                          child: Text(
                            "Add net price",
                            style: TextStyle(
                                fontWeight:
                                FontWeight
                                    .w500,
                                fontSize:
                                18),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(35)),
                            color: Colors.white.withOpacity(0.3),),
                          child: defaultTextFieldPharmacy3(
                              controller:
                              medicineNetPriceController,
                              prefix: Icons
                                  .price_change_outlined,
                              hint:
                              "net price  ",
                              type: TextInputType
                                  .name,
                              validate:
                                  (value) {
                                if (value
                                    .isEmpty) {
                                  return "Your net price must not be empty";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Padding(
                          padding: EdgeInsets
                              .only(
                              left:
                              16.0),
                          child: Text(
                            "Add size ",
                            style: TextStyle(
                                fontWeight:
                                FontWeight
                                    .w500,
                                fontSize:
                                18),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(35)),
                            color: Colors.white.withOpacity(0.3),),
                          child: defaultTextFieldPharmacy3(
                              controller:
                              medicineSizeController,
                              prefix: Icons
                                  .medication_outlined,
                              hint:
                              " size  ",
                              type: TextInputType
                                  .name,
                              validate:
                                  (value) {
                                if (value
                                    .isEmpty) {
                                  return "Your  size must not be empty";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Padding(
                          padding: EdgeInsets
                              .only(
                              left:
                              16.0),
                          child: Text(
                            "Add parts of medicine ",
                            style: TextStyle(
                                fontWeight:
                                FontWeight
                                    .w500,
                                fontSize:
                                18),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(35)),
                            color: Colors.white.withOpacity(0.3),),
                          child: defaultTextFieldPharmacy3(
                              controller:
                              medicinePartController,
                              prefix: Icons
                                  .numbers_outlined,
                              hint:
                              " parts of medicine  ",
                              type: TextInputType
                                  .name,
                              validate:
                                  (value) {
                                if (value
                                    .isEmpty) {
                                  return "Your  parts of medicine must not be empty";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Padding(
                          padding: EdgeInsets
                              .only(
                              left:
                              16.0),
                          child: Text(
                            "Add company name ",
                            style: TextStyle(
                                fontWeight:
                                FontWeight
                                    .w500,
                                fontSize:
                                18),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(35)),
                            color: Colors.white.withOpacity(0.3),),
                          child: defaultTextFieldPharmacy3(
                              controller:
                              medicineCompanyController,
                              prefix: Icons
                                  .warehouse,
                              hint:
                              " company name  ",
                              type: TextInputType
                                  .name,
                              validate:
                                  (value) {
                                if (value
                                    .isEmpty) {
                                  return "Your  company name of medicine must not be empty";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Padding(
                          padding: EdgeInsets
                              .only(
                              left:
                              16.0,
                              bottom:
                              24),
                          child: Text(
                            "Add Active matrail ",
                            style: TextStyle(
                                fontWeight:
                                FontWeight
                                    .w500,
                                fontSize:
                                18),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(35)),
                            color: Colors.white.withOpacity(0.3),),
                          child: defaultTextFieldPharmacy3(
                              controller:
                              active_mat_arController1,
                              prefix: Icons
                                  .warehouse,
                              hint:
                              " active material ar  ",
                              type: TextInputType
                                  .name,
                              validate:
                                  (value) {
                                if (value
                                    .isEmpty) {
                                  return "Your  active material of medicine must not be empty";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(35)),
                            color: Colors.white.withOpacity(0.3),),
                          child: defaultTextFieldPharmacy3(
                              controller:
                              active_mat_enController1,
                              prefix: Icons
                                  .warehouse,
                              hint:
                              " active material en  ",
                              type: TextInputType
                                  .name,
                              validate:
                                  (value) {
                                if (value
                                    .isEmpty) {
                                  return "Your  active material of medicine must not be empty";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(35)),
                            color: Colors.white.withOpacity(0.3),),
                          child: defaultTextFieldPharmacy3(
                              controller:
                              concentrationController1,
                              prefix: Icons
                                  .warehouse,
                              hint:
                              " concentration ",
                              type: TextInputType
                                  .number,
                              validate:
                                  (value) {
                                if (value
                                    .isEmpty) {
                                  return "Your  concentration of medicine must not be empty";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        // ListView
                        //     .builder(
                        //   padding:
                        //   const EdgeInsets
                        //       .symmetric(),
                        //   shrinkWrap:
                        //   true,
                        //   itemCount:
                        //   listController
                        //       .length,
                        //   itemBuilder:
                        //       (context,
                        //       index) {
                        //     return Padding(
                        //       padding: const EdgeInsets
                        //           .only(
                        //           top:
                        //           15),
                        //       child:
                        //       Row(
                        //         children: [
                        //           Expanded(
                        //             child: Container(
                        //               decoration: BoxDecoration(
                        //                 borderRadius: BorderRadius.all( Radius.circular(35)),
                        //                 color: Colors.white.withOpacity(0.3),),
                        //               child: defaultTextFieldPharmacy3(
                        //                   controller: listController[index],
                        //                   prefix: Icons.local_activity_outlined,
                        //                   hint: " Active matrail  ",
                        //                   type: TextInputType.name,
                        //                   validate: (value) {
                        //                     if (value.isEmpty) {
                        //                       return "Your  company name of medicine must not be empty";
                        //                     } else {
                        //                       return null;
                        //                     }
                        //                   }),
                        //             ),
                        //           ),
                        //           const SizedBox(
                        //             width:
                        //             10,
                        //           ),
                        //           index != 0
                        //               ? GestureDetector(
                        //             onTap: () {
                        //               setState(() {
                        //                 listController[index].clear();
                        //                 listController[index].dispose();
                        //                 listController.removeAt(index);
                        //               });
                        //             },
                        //             child: const Icon(
                        //               Icons.delete,
                        //               color: Colors.red,
                        //               size: 20,
                        //             ),
                        //           )
                        //               : const SizedBox()
                        //         ],
                        //       ),
                        //     );
                        //   },
                        // ),
                        // const SizedBox(
                        //   height: 50,
                        // ),
                        //
                        // GestureDetector(
                        //   onTap: () {
                        //     setState(
                        //             () {
                        //           listController
                        //               .add(
                        //               TextEditingController());
                        //         });
                        //   },
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left:250.0),
                        //     child: Text(
                        //      "Add More",
                        //      style: TextStyle(color: HexColor(green)),
                        //       ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 24,
                        ),
                        Visibility(
                            visible:visibel ,
                            child:Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all( Radius.circular(35)),
                                    color: Colors.white.withOpacity(0.3),),
                                  child: defaultTextFieldPharmacy3(
                                      controller:
                                      active_mat_enController2,
                                      prefix: Icons
                                          .warehouse,
                                      hint:
                                      " active material en  ",
                                      type: TextInputType
                                          .name,
                                      validate:
                                          (value) {
                                        if (value
                                            .isEmpty) {
                                          return "Your  active material of medicine must not be empty";
                                        } else {
                                          return null;
                                        }
                                      }),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all( Radius.circular(35)),
                                    color: Colors.white.withOpacity(0.3),),
                                  child: defaultTextFieldPharmacy3(
                                      controller:
                                      active_mat_arController2,
                                      prefix: Icons
                                          .warehouse,
                                      hint:
                                      " active material an ",
                                      type: TextInputType
                                          .name,
                                      validate:
                                          (value) {
                                        if (value
                                            .isEmpty) {
                                          return "Your  concentration of medicine must not be empty";
                                        } else {
                                          return null;
                                        }
                                      }),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all( Radius.circular(35)),
                                    color: Colors.white.withOpacity(0.3),),
                                  child: defaultTextFieldPharmacy3(
                                      controller:
                                      concentrationController2,
                                      prefix: Icons
                                          .warehouse,
                                      hint:
                                      " concentration ",
                                      type: TextInputType
                                          .number,
                                      validate:
                                          (value) {
                                        if (value
                                            .isEmpty) {
                                          return "Your  concentration of medicine must not be empty";
                                        } else {
                                          return null;
                                        }
                                      }),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed:(){
                              setState(() {
                                visibel=!visibel;
                              });
                            }, child: visibel==false?Text("Add Material an other",style: TextStyle(color: HexColor(green)),):
                            Text("remove",style: TextStyle(color: HexColor(green)),)),
                          ],
                        ),
                        Visibility(
                            visible:visibel1 ,
                            child:Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all( Radius.circular(35)),
                                    color: Colors.white.withOpacity(0.3),),
                                  child: defaultTextFieldPharmacy3(
                                      controller:
                                      active_mat_enController3,
                                      prefix: Icons
                                          .warehouse,
                                      hint:
                                      " active material en  ",
                                      type: TextInputType
                                          .name,
                                      validate:
                                          (value) {
                                        if (value
                                            .isEmpty) {
                                          return "Your  active material of medicine must not be empty";
                                        } else {
                                          return null;
                                        }
                                      }),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all( Radius.circular(35)),
                                    color: Colors.white.withOpacity(0.3),),
                                  child: defaultTextFieldPharmacy3(
                                      controller:
                                      active_mat_arController3,
                                      prefix: Icons
                                          .warehouse,
                                      hint:
                                      " active material an ",
                                      type: TextInputType
                                          .name,
                                      validate:
                                          (value) {
                                        if (value
                                            .isEmpty) {
                                          return "Your  concentration of medicine must not be empty";
                                        } else {
                                          return null;
                                        }
                                      }),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all( Radius.circular(35)),
                                    color: Colors.white.withOpacity(0.3),),
                                  child: defaultTextFieldPharmacy3(
                                      controller:
                                      concentrationController3,
                                      prefix: Icons
                                          .warehouse,
                                      hint:
                                      " concentration ",
                                      type: TextInputType
                                          .number,
                                      validate:
                                          (value) {
                                        if (value
                                            .isEmpty) {
                                          return "Your  concentration of medicine must not be empty";
                                        } else {
                                          return null;
                                        }
                                      }),
                                ),
                              ],
                            )),
                        ConditionalBuilder(
                            condition: visibel==true,
                            builder: (context) => Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(onPressed:(){
                                  setState(() {
                                    visibel1=!visibel1;
                                  });
                                }, child: visibel1==false?Text("Add Material an other",style: TextStyle(color: HexColor(green)),):
                                Text("remove",style: TextStyle(color: HexColor(green)),)),
                              ],
                            ),
                            fallback: (context) =>SizedBox() ,),
                        ConditionalBuilder(
                            condition: state is !CreateMedicineWarehouseAddDisLoadingState,
                            builder: (context) => newDefaultButton6(

                              function:
                                  () {
                                if(visibel==false&&visibel1==false){
                                  PharmacyHomeCubit.get(context).createMedicine
                                    (trade_name_ar:medicineNameArController.text
                                      , trade_name_en: medicineNameEnController.text,
                                      description_ar: medicineDescriptionArController.text,
                                      description_en: medicineDescriptionEnController.text,
                                      meicine_form_ar: medicineFormArController.text,
                                      meicine_form_en: medicineFormEnController.text,
                                      commercial_price: medicineComPriceController.text,
                                      net_price: medicineNetPriceController.text,
                                      size: medicineSizeController.text,
                                      parts: medicinePartController.text,
                                      img: imageFile,
                                      company_id: medicineCompanyController.text,
                                      active_mats_active_mat_ar: active_mat_arController1.text,
                                      active_mats_active_mat_en: active_mat_enController1.text,
                                      active_mats_concentration: concentrationController1.text);

                                }
                                if(visibel==true&&visibel1==false){
                                  PharmacyHomeCubit.get(context).createMedicine1
                                    (trade_name_ar:medicineNameArController.text
                                    , trade_name_en: medicineNameEnController.text,
                                    description_ar: medicineDescriptionArController.text,
                                    description_en: medicineDescriptionEnController.text,
                                    meicine_form_ar: medicineFormArController.text,
                                    meicine_form_en: medicineFormEnController.text,
                                    commercial_price: medicineComPriceController.text,
                                    net_price: medicineNetPriceController.text,
                                    size: medicineSizeController.text,
                                    parts: medicinePartController.text,
                                    img: imageFile,
                                    company_id: medicineCompanyController.text,
                                    active_mats_active_mat_ar: active_mat_arController1.text,
                                    active_mats_active_mat_en: active_mat_enController1.text,
                                    active_mats_concentration: concentrationController1.text,
                                    active_mats_active_mat_ar1:active_mat_arController2.text ,
                                    active_mats_active_mat_en1:active_mat_enController2.text ,
                                    active_mats_concentration1:concentrationController2 .text,
                                  );
                                }
                                if(visibel=true&&visibel1==true){
                                  PharmacyHomeCubit.get(context).createMedicine2
                                    (trade_name_ar:medicineNameArController.text
                                    , trade_name_en: medicineNameEnController.text,
                                    description_ar: medicineDescriptionArController.text,
                                    description_en: medicineDescriptionEnController.text,
                                    meicine_form_ar: medicineFormArController.text,
                                    meicine_form_en: medicineFormEnController.text,
                                    commercial_price: medicineComPriceController.text,
                                    net_price: medicineNetPriceController.text,
                                    size: medicineSizeController.text,
                                    parts: medicinePartController.text,
                                    img: imageFile,
                                    company_id: medicineCompanyController.text,
                                    active_mats_active_mat_ar: active_mat_arController1.text,
                                    active_mats_active_mat_en: active_mat_enController1.text,
                                    active_mats_concentration: concentrationController1.text,
                                    active_mats_active_mat_ar1:active_mat_arController2.text ,
                                    active_mats_active_mat_en1:active_mat_enController2.text ,
                                    active_mats_concentration1:concentrationController2 .text,
                                    active_mats_active_mat_ar2: active_mat_arController3.text,
                                    active_mats_active_mat_en2:active_mat_enController3.text ,
                                    active_mats_concentration2: concentrationController3.text
                                  );
                                }
                              },
                              text: "Add",
                            ),
                            fallback: (context) => Center(child: CircularProgressIndicator()),)
                      ],
                    ),
                  ),
                )));
      },

    );
  }
  Widget bottomSheet(context) {
    return Container(

      height: 100.0,
      width: MediaQuery.of(context).size.width,

      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            'choose syndicate id copy',
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              TextButton.icon(
                  onPressed: () {
                    _getFromCamera();
                  },
                  label: const Text(
                    'Camera',
                    style: TextStyle(color: Colors.grey),
                  ),
                  icon:  Icon(
                    Icons.camera_alt,
                    color: HexColor(green.toString()),
                  )),
              const Spacer(),
              TextButton.icon(
                  onPressed: () {
                    _getFromGallery();
                  },
                  label: const Text(
                    'Gallery',
                    style: TextStyle(color: Colors.grey),
                  ),
                  icon:  Icon(Icons.image, color: HexColor(green.toString()))),
            ],
          ),
        ],
      ),
    );
  }
  _getFromGallery() async {
    var picker=ImagePicker();
    // PickedFile?image;
    final pickFile=await picker.pickImage(source: ImageSource.gallery);

    if (pickFile!=null) {
      setState(() {
        imageFile = pickFile.path;
        image=File(pickFile.path);
      });
      // bytes=File(image!.path).readAsBytesSync();
      // img64=base64Encode(bytes!);

    }

  }

  /// Get from Camera
  _getFromCamera() async {
    var picker=ImagePicker();
    // PickedFile?image;
    final pickFile=await picker.pickImage(source: ImageSource.camera);

    if (pickFile!=null) {
      setState(() {
        imageFile = pickFile.path;
        image=File(pickFile.path);
      });
      // bytes=File(image!.path).readAsBytesSync();
      // img64=base64Encode(bytes!);

    }
  }

}

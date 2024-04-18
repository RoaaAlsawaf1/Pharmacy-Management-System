import 'dart:io';
import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacy/Home/drawer.dart';
import 'package:pharmacy/Home/home.dart';
import 'package:pharmacy/Rigester_Warehouse/cubit.dart';
import 'package:pharmacy/Rigester_Warehouse/states.dart';
import 'package:pharmacy/animation/onboarder.dart';
import 'package:pharmacy/shared/components/constant.dart';


import '../../../shared/components/components.dart';
import '../Rigester_pharmacy/Success_Screen_Pharmacy.dart';



class RegisterWarehouseScreen extends StatefulWidget{

  @override
  State<RegisterWarehouseScreen> createState() => _RegisterWarehouseScreenState();
}

class _RegisterWarehouseScreenState extends State<RegisterWarehouseScreen> {
  List<String> listItem = ["44".tr, "45".tr];

  List<String> listItemCity = [
    "46".tr,
    "47".tr,
    "48".tr,
    "49".tr,
    "50".tr,
    "51".tr,
    "52".tr,
    "53".tr,
    "54".tr,
    "55".tr,
    "56".tr,
    "57".tr,
    "58".tr,
    "59".tr,
  ];

  File? image;

  String? imageFile;

  //صورة
  var phoneController = TextEditingController();

  // var ageController = TextEditingController();
  var cityController = TextEditingController();

  var pharmacyNameController = TextEditingController();

  var pharmacyNumberController = TextEditingController();

  var longitudeController = TextEditingController();

  var latitudeController = TextEditingController();

  // var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WarehouseRegisterCubit,WarehouseRegisterStates>(
      listener:(context, state) {
        if(state is WarehouseSuccessState){
          if(state.value==200){
            navigateAndFinish(context: context,widget: SuccessScreen());
          }
        }
        if(state is WarehouseErrorState){
          if(state.error==422){
            showToast(text:"The Warehouse name has already been taken" ,state: ToastStates.EROOR);
          }
          else{
            showToast(text:"Wrong " ,state: ToastStates.EROOR);}

        }
      },
      builder: ((context, state) {
        WarehouseRegisterCubit.get(context).getAllCityDropDownItems();
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
          //       navigateTo(widget: drawerScreen() ,context:context);
          //     }, icon:Icon(Icons.arrow_back,color:HexColor(green.toString()),)),
          //   ),
          //   title: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Text("Add Warehouse", style: TextStyle(color:HexColor(green.toString()))),
          //   ),
          //
          //
          // ),
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
              child:  Text("381".tr,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16, color: Colors.grey.shade800,
              )),
            ),
            leading:Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: () {
                navigateTo(widget: drawerScreen() ,context:context);
              }, icon: Icon(Icons.arrow_back_ios_new_outlined,color:HexColor(green),)),
            ),

          ),
          body: Container(
            height:MediaQuery.of(context).size.height ,
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
              physics:const BouncingScrollPhysics(),
              child: Container(
                height: 1000,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16,top: 130),
                  child: Column(
                    children: [
                      ///////////////////////////////////////////////////////////first name
                      //    defaultTextFieldPharmacy(
                      //        controller: firstNameController,
                      //        type: TextInputType.name,
                      //        validate: (String? value) {
                      //          if (value!.isEmpty) {
                      //            return "First Name must not be empty";
                      //          }
                      //          return null;
                      //        },
                      //        onSubmit: (value) {},
                      //        hint: "38".tr,
                      //        prefix: Icons.person_outline),
                      // ////////////////////////////////////////////////////////////
                      // const   SizedBox(
                      //      height: 16,
                      //    ),
                      // ////////////////////////////////////////////////////////////////last name
                      //     defaultTextFieldPharmacy(
                      //         controller: lastNameController,
                      //         type: TextInputType.name,
                      //         validate: (String? value) {
                      //           if (value!.isEmpty) {
                      //             return "Last Name must not be empty";
                      //           }
                      //           return null;
                      //         },
                      //         onSubmit: (value) {},
                      //         hint: "39".tr,
                      //         prefix: Icons.person_outline),
                      // ////////////////////////////////////////////////////////////////////////////
                      // const  SizedBox(
                      //       height: 16,
                      //     ),
                      //////////////////////////////////////////////////////////////////////////email
                      //     defaultTextFieldPharmacy(
                      //         controller: emailController,
                      //         type: TextInputType.emailAddress,
                      //         validate: (String? value) {
                      //           if (value!.isEmpty) {
                      //             return "Email  Address must not be empty";
                      //           }
                      //           return null;
                      //         },
                      //         onSubmit: (value) {},
                      //         hint: "40".tr,
                      //         prefix: Icons.email_outlined),
                      // ///////////////////////////////////////////////////////////////////
                      //  const   SizedBox(
                      //       height: 16,
                      //     ),
                      // ////////////////////////////////////////////////////////////////////  phone
                      //     defaultTextFieldPharmacy(
                      //         controller: phoneController,
                      //         type: TextInputType.phone,
                      //         validate: (String? value) {
                      //           if (value!.isEmpty) {
                      //             return "Phone Number must not be empty";
                      //           }
                      //           return null;
                      //         },
                      //         onSubmit: (value) {},
                      //         hint: "41".tr,
                      //         prefix: Icons.phone_android_outlined),
                      //   ///////////////////////////////////////////////////////////////////
                      //   const  SizedBox(
                      //       height: 16,
                      //     ),
                      //       defaultTextFieldPharmacy(
                      //           controller: passwordController,
                      //           type: TextInputType.number,
                      //           hint: "42".tr,
                      //           validate: (String? value) {
                      //             if (value!.isEmpty) {
                      //               return "Your password must not be empty";
                      //             }
                      //             return null;
                      //           },
                      //           prefix:Icons.lock_outline,
                      //           suffixPressed:() {
                      //
                      //       PharmacyRegisterCubit.get(context).changePasswordVisibility();
                      // },
                      //   suffix: PharmacyRegisterCubit.get(context).suffix,
                      //   isPassword: PharmacyRegisterCubit.get(context).isPasswordShown,
                      //
                      // ),
                      //         const SizedBox(
                      //           height: 16,
                      //         ),
                      //       //////////////////////////////////////////////////////////////////////  female male
                      //         Container(
                      //           clipBehavior: Clip.antiAliasWithSaveLayer,
                      //           width: double.infinity,
                      //           decoration: BoxDecoration(
                      //             color: HexColor("E5E4E2"),
                      //             borderRadius: BorderRadius.circular(35),
                      //           ),
                      //           child: Padding(
                      //             padding: const EdgeInsets.only(left: 16),
                      //             child: Row(
                      //               children: [
                      //                 Icon(
                      //                   Icons.people_outline,
                      //                   color:HexColor(green.toString()),
                      //
                      //                 ),
                      //                 Padding(
                      //                   padding: const EdgeInsets.symmetric(horizontal: 16),
                      //                   child: DropdownButton<String>(
                      //                     hint: Text("43".tr),
                      //                     icon:const Icon(Icons.arrow_drop_down_outlined),
                      //                     iconSize: 20,
                      //                     dropdownColor: HexColor("E5E4E2"),
                      //                     underline:const SizedBox(),
                      //                     items: listItem
                      //                         .map((item) => DropdownMenuItem<String>(
                      //                       value: item,
                      //                       child: Text(item,
                      //                           style: TextStyle(
                      //                               color: HexColor("6C6D72"),
                      //                               fontSize: 14)),
                      //                     ))
                      //                         .toList(),
                      //                     onChanged: (item) =>PharmacyRegisterCubit.get(context).changeDropDownGender(item),
                      //                     value: PharmacyRegisterCubit.get(context).selectedItemGender,
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //        const SizedBox(
                      //           height: 16,
                      //         ),
                      //         /////////////////////////////////////////////////////age
                      //        defaultTextFieldPharmacy(
                      //             controller: ageController,
                      //             type: TextInputType.number,
                      //             validate: (String? value) {
                      //               if (value!.isEmpty) {
                      //                 return "Your Age must not be empty";
                      //               }
                      //               return null;
                      //             },
                      //             onSubmit: (value) {},
                      //             hint: "60".tr,
                      //             prefix: Icons.account_box_outlined),
                      //       const  SizedBox(
                      //           height: 16,
                      //         ),
                      /////////////////////////////////////////////pharmacyName
                      defaultTextFieldPharmacy(
                          controller: pharmacyNameController,
                          type: TextInputType.name,
                          validate: ( value) {
                            if (value!.isEmpty) {
                              return "pharmacy Name must not be empty";
                            }
                            return null;
                          },
                          onSubmit: (value) {},
                          hint: "66".tr,
                          prefix: Icons.local_pharmacy_outlined),
                      const  SizedBox(height: 16,),
                      ////////////////////////////////////////////////Number
                      defaultTextFieldPharmacy(
                          controller: pharmacyNumberController,
                          type: TextInputType.number,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "pharmacy Number must not be empty";
                            }
                            return null;
                          },
                          onSubmit: (value) {},
                          hint: "67".tr,
                          prefix: Icons.phone),
                      const  SizedBox(
                        height:16,
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
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(30)),
                            color:HexColor("E5E4E2") ,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width:16 ,),
                              Icon(Icons.picture_in_picture_alt_outlined,color: HexColor(green.toString()),
                              ),
                              const SizedBox(width:8 ,),
                              Text("380".tr,style: TextStyle(
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
                      const  SizedBox(
                        height:16,
                      ),

                      Row(
                        children: [

                          Expanded(
                            child: Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: HexColor("E5E4E2"),
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0,right: 16),
                                    child: Icon(Icons.location_city,color: HexColor(green.toString())),
                                  ),
                                  SizedBox(width: 10,),
                                  DropdownButton<String>(
                                    menuMaxHeight: 300,

                                    icon:  Icon(Icons.arrow_drop_down_outlined,color:
                                    HexColor(green.toString())),
                                    iconSize: 20,
                                    dropdownColor: HexColor("E5E4E2"),
                                    underline: const SizedBox(),
                                    value: WarehouseRegisterCubit.get(context).selectedAllCity,
                                    onChanged:(value) {

                                      setState(() {
                                        WarehouseRegisterCubit.get(context).changeSelectedCity(value!);
                                      });

                                    },
                                    items: WarehouseRegisterCubit.get(context).allCityDropDownItems,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          /////////////////////////////////////////////////area
                          // Expanded(
                          //   child: defaultTextFieldPharmacy(
                          //       controller: areaController,
                          //       type: TextInputType.text,
                          //       validate: (String? value) {
                          //         if (value!.isEmpty) {
                          //           return "Your Area must not be empty";
                          //         }
                          //         return null;
                          //       },
                          //       onSubmit: (value) {},
                          //       hint: "61".tr,
                          //       prefix: Icons.area_chart_outlined),
                          // ),
                        ],
                      ),
                      const  SizedBox(
                        height:16,
                      ),
                      ///////////////////////////////////location
                      defaultTextFieldPharmacy(
                          controller: cityController,
                          type: TextInputType.text,
                          validate: ( value) {
                            if (value!.isEmpty) {
                              return "Your Location must not be empty";
                            }
                            return null;
                          },
                          onSubmit: (value) {},
                          hint: "62".tr,
                          prefix: Icons.description_outlined),
                      const SizedBox(height: 16,),

                      const  SizedBox(
                        height: 50,
                      ),
                      //PharmacyRegisterCubit
                      ConditionalBuilder(
                        condition: state is !WarehouseLoadingState ,
                        builder: (context) => newDefaultButton(
                            text: "379".tr,
                            background: HexColor(green.toString()),
                            function: () {



                              WarehouseRegisterCubit.get(context).pharmacyRegister(
                                  img:imageFile,
                                  pharmacyName:pharmacyNameController.text,
                                  number: pharmacyNumberController.text,
                                location_desc:cityController.text);



                            },
                            width: double.infinity,

                            isAppbar: false),
                        fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      })

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

  Widget imageProfile(context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: <Widget>[//confirmation
          CircleAvatar(
            radius: 20.0,
            backgroundImage: image != null
                ? FileImage(image! ) as ImageProvider
                : AssetImage("images/p.jpeg"),
          ),
          SizedBox(height:60,
              child: LottieBuilder.asset('images/confirmation.json',fit:BoxFit.cover,width: 40,height: 40,)),

        ],
      ),
    );
  }
}

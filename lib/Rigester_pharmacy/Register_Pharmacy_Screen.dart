import 'dart:io';
import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacy/Home/drawer.dart';
import 'package:pharmacy/Home/home.dart';
import 'package:pharmacy/Rigester_pharmacy/Success_Screen_Pharmacy.dart';
import 'package:pharmacy/Rigester_pharmacy/cubit.dart';
import 'package:pharmacy/Rigester_pharmacy/states.dart';
import 'package:pharmacy/animation/onboarder.dart';
import 'package:pharmacy/shared/components/constant.dart';


import 'package:decimal/decimal.dart';
import '../../../shared/components/components.dart';


class RegisterPharmacyScreen extends StatefulWidget{

  @override
  State<RegisterPharmacyScreen> createState() => _RegisterPharmacyScreenState();
}

class _RegisterPharmacyScreenState extends State<RegisterPharmacyScreen> {

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


  // TimeOfDay _timeOfDay = const TimeOfDay(hour: 0, minute: 00);
  // bool clicked = false;
  late TimeOfDay _selectedTimeFrom;
  late TimeOfDay _selectedTimeTo;
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
  var timeControllerFrom = TextEditingController();
  var timeControllerTo = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyRegisterCubit,PharmacyRegisterStates>(
      listener:(context, state) {
        if(state is PharmacyAddSuccessState){
          if(state.value==200){
           navigateAndFinish(context: context,widget: SuccessScreen());
          }
        }
        if(state is PharmacyAddErrorState){
          if(state.error==422){
            showToast(text:"The pharmacy name has already been taken" ,state: ToastStates.EROOR);
          }
          else{
            showToast(text:"Wrong " ,state: ToastStates.EROOR);}

        }
      },
      builder: ((context, state) {
      //  List<dynamic>dayList=PharmacyRegisterCubit.get(context).day;
      //  List<String>dayss=dayList.map((e) => e['name'].toString()).toList();
        PharmacyRegisterCubit.get(context).getDay();
        PharmacyRegisterCubit.get(context).getMedicinesDropDownItems();
        PharmacyRegisterCubit.get(context).getAllCityDropDownItems();
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
          //     child: Text("71".tr, style: TextStyle(color:HexColor(green.toString()))),
          //   ),
          //   // actions: [
          //   //   Padding(
          //   //     padding: const EdgeInsets.only(right:36,top: 24),
          //   //     child: ConditionalBuilder(condition: state is !PharmacyLoadingState && imageFile!=null , builder:(context) =>imageProfile(context) , fallback:(context) =>  SizedBox()),
          //   //   )
          //   // ],
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
              child:  Text("Add Pharmacy",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16, color: Colors.grey.shade800,
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
                  padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16,top:130),
                  child: Column(
                    children: [

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
                          validate: ( value) {
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
                              Text("Permission to open the pharmacy",style: TextStyle(
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
                             child:  Container(
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
                                     value: PharmacyRegisterCubit.get(context).selectedAllCity,
                                     onChanged:(value) {

                                       setState(() {
                                         PharmacyRegisterCubit.get(context).changeSelectedCity(value!);
                                       });

                                     },
                                     items: PharmacyRegisterCubit.get(context).allCityDropDownItems,
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
                      defaultTextFieldPharmacy(
                          controller: longitudeController,
                          type: TextInputType.number,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "longitude must not be empty";
                            }
                            return null;
                          },
                          onSubmit: (value) {},
                          hint: "69".tr,
                          prefix: Icons.location_searching_outlined),
                      const  SizedBox(
                        height:16,
                      ),
                      defaultTextFieldPharmacy(
                          controller: latitudeController,
                          type: TextInputType.number,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "latitude must not be empty";
                            }
                            return null;
                          },
                          onSubmit: (value) {},
                          hint: "70".tr,
                          prefix: Icons.location_searching_outlined),
                      const  SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex:2,
                              child: Text("  Choose the day off :",style: TextStyle(fontSize: 16),)),
                          Expanded(
                            flex:2,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: HexColor("E5E4E2"),
                                borderRadius: BorderRadius.all(Radius.circular(35)),
                              ),

                              child: Padding(

                                padding: const EdgeInsets.only(left: 16,right: 16),
                                child: DropdownButton<String>(
                                  menuMaxHeight: 300,

                                  icon:  Icon(Icons.arrow_drop_down_outlined,color:
                                  HexColor(green.toString())),
                                  iconSize: 20,
                                  dropdownColor: HexColor("E5E4E2"),
                                  underline: const SizedBox(),
                                  value: PharmacyRegisterCubit.get(context).selectedDay,
                                  onChanged:(value) {
                               setState(() {
                           PharmacyRegisterCubit.get(context).changeSelectedMedicine(value!);

                                 });

                                  },
                                  items: PharmacyRegisterCubit.get(context).dayDropDownItems,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const  SizedBox(
                        height: 16,
                      ),
                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("  Choose the working time :",style: TextStyle(fontSize: 16),),
                        ],
                      ),
                      const  SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [

                          Expanded(
                            flex:1,

                            child: defaultTextFieldPharmacyFrom(
                                controller:timeControllerFrom,
                                type: TextInputType.number,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "latitude must not be empty";
                                  }
                                  return null;
                                },
                              prefix: Icons.watch_later_outlined,
                               onPressed:()async {
                                 _selectedTimeFrom = (await showTimePicker(
                                   context: context,
                                   initialTime: TimeOfDay.now(),
                                 ))!;
                               //   DateTime selectedDateTime =DateTime.now().add(Duration(hours: _selectedTimeFrom.hour, minutes: _selectedTimeFrom.minute)) ;
                               //   timeControllerFrom.text=DateFormat("h:mm a").format(selectedDateTime);
                                 timeControllerFrom.text = DateFormat.Hm().format(
                                   DateTime(2021, 1, 1, _selectedTimeFrom.hour, _selectedTimeFrom.minute),
                                 );
                                },
                                hint: "From",

                          ),),

                          Expanded(
                            flex:1,

                            child: defaultTextFieldPharmacyTo(
                                controller: timeControllerTo,
                                type: TextInputType.number,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "";
                                  }
                                  return null;
                                },
                              prefix:Icons.watch_later_outlined ,
                             // suffix:Icons.watch_later_outlined,
                              onPressed:()async {
                                _selectedTimeTo = (await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ))!;
                                // DateTime selectedDateTime =DateTime.now().add(Duration(hours: _selectedTimeTo.hour, minutes: _selectedTimeTo.minute)) ;
                                // timeControllerTo.text=DateFormat("h:mm a").format(selectedDateTime);
                                 timeControllerTo.text = DateFormat.Hm().format(
                                  DateTime(2021, 1, 1, _selectedTimeTo.hour, _selectedTimeTo.minute),
                                );
                              },
                                hint: "To",
                            )
                          ),
                          /////////////////////////////////////////////////area

                        ],
                      ),

                    const  SizedBox(
                        height: 40,
                      ),
                      //PharmacyRegisterCubit
                      ConditionalBuilder(
                        condition: state is !PharmacyAddLoadingState ,
                        builder: (context) => newDefaultButton(
                            text: "Add New Pharmacy ",
                            background: HexColor(green.toString()),
                            function: () {
                                 int hourFrom=(_selectedTimeFrom.hour*60)+_selectedTimeFrom.minute;
                                 int hourTo=(_selectedTimeTo.hour*60)+_selectedTimeTo.minute;

                                 print(hourFrom);

                                 print(imageFile);

                              PharmacyRegisterCubit.get(context).pharmacyRegister(

                                  pharmacyName:pharmacyNameController.text,
                                  number: pharmacyNumberController.text,
                                  longitude:longitudeController.text,
                                  image:imageFile,
                                  latitude:latitudeController.text,location_desc:cityController.text,
                                from_min: hourFrom,
                                to_min: hourTo

                              );



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
  // Future<TimeOfDay> _selectTime() async {
  //
  //   final TimeOfDay? picked =
  //   await showTimePicker(context: context, initialTime: _timeOfDay);
  //
  //   if (picked != null && picked != _timeOfDay) {
  //     setState(() {
  //       _timeOfDay = picked;
  //       clicked = true;
  //     });
  //   }
  //   return picked!;
  // }
}





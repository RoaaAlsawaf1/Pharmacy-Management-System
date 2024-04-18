import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/home.dart';
import 'package:pharmacy/Rigester_user/cubit.dart';
import 'package:pharmacy/Rigester_user/states.dart';
import 'package:pharmacy/animation/onboarder.dart';
import 'package:pharmacy/login/Verification.dart';
import 'package:pharmacy/login/login_screen.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';
import 'package:pharmacy/shared/network/remote/dio_helper.dart';

import '../../../shared/components/components.dart';

class RegisterUserScreen extends StatefulWidget {
  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  List<String> listItem = ["44".tr, "45".tr];

  List<String> listItemCity = [
    "46".tr,//دمشق 1
    "47".tr,//ريف دمشق 2
    "48".tr,//حلب3
    "49".tr,//الرقة12
    "50".tr,//السويداء13
    "51".tr,//4درعا
    "52".tr,//5دير الزور
    "53".tr,//6حماة
    "54".tr,//الحسكة7
    "55".tr,//حمص8
    "56".tr,//9ادلب
    "57".tr,//الادقية10
    "58".tr,//القنيطرة11
    "59".tr,//طرطوس14
  ];

  var firstNameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  var ageController = TextEditingController();

  var areaController = TextEditingController();

  var locationController = TextEditingController();

  var cityController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserRegisterCubit, UserRegisterStates>(
        listener: (context, state) {
      if(state is UserSuccessSendEmailState)//نجاح او فشل التسجيل
          {print(',d,,,,dd');
             if(state.value==200){
               print(',d,,,,dd');
               Get.to(() => VerificationScreen(), arguments: [
                 firstNameController.text,//اسم
                 emailController.text,//ايميل
                 passwordController.text,//باسورد
                 ageController.text,//عمر
                 phoneController.text,//رقم,
                 areaController.text,//damac



               ]);
             }
               if(state.value==422){
               showToast(text:"error! the email already exist" ,state: ToastStates.EROOR);
             }
          }
      if(state is UserErrorSendEmailState){
        if(state.error==422){
          showToast(text:"error! the email already exist" ,state: ToastStates.EROOR);
        }
        else{
        showToast(text:"Wrong way to write the email" ,state: ToastStates.EROOR);}

      }



    }, builder: ((context, state) {
      UserRegisterCubit.get(context).getAllCityDropDownItems();
      UserRegisterCubit.get(context).getAllCity();

      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          titleSpacing: 0.0,
          leadingWidth: 46,
          elevation: 0.0,
          flexibleSpace: Container(
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
                ],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  navigateTo(widget: Login(), context: context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: HexColor(green.toString()),
                )),
          ),
          title: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("19".tr,
                style: TextStyle(color: HexColor(green.toString()))),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
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
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16, top: 16),
              child: Column(
                key: formKey,
                children: [
                  defaultTextFieldPharmacy(
                      controller: firstNameController,
                      type: TextInputType.name,
                      validate: ( value) {
                        if (value!.isEmpty) {
                          return "First Name must not be empty";
                        }
                        return null;
                      },
                      onSubmit: (value) {},
                      hint: "38".tr,
                      prefix: Icons.person_outline),
                  SizedBox(
                    height: 16,
                  ),
                  // defaultTextFieldPharmacy(
                  //     controller: lastNameController,
                  //     type: TextInputType.name,
                  //     validate: (String? value) {
                  //       if (value!.isEmpty) {
                  //         return "Last Name must not be empty";
                  //       }
                  //       return null;
                  //     },
                  //     onSubmit: (value) {},
                  //     hint: "39".tr,
                  //     prefix: Icons.person_outline),
                  // SizedBox(
                  //   height: 16,
                 // ),
                  defaultTextFieldPharmacy(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Email  Address must not be empty";
                        }
                        return null;
                      },
                      onSubmit: (value) {},
                      hint: "40".tr,
                      prefix: Icons.email_outlined),
                  SizedBox(
                    height: 16,
                  ),
                  defaultTextFieldPharmacy(
                      controller: phoneController,
                      type: TextInputType.phone,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Phone Number must not be empty";
                        }
                        return null;
                      },
                      onSubmit: (value) {},
                      hint: "41".tr,
                      prefix: Icons.phone_android_outlined),
                  SizedBox(
                    height: 16,
                  ),
                  defaultTextFieldPharmacy(
                    controller: passwordController,
                    type: TextInputType.number,
                    hint: "42".tr,
                    validate: ( value) {
                      if (value!.isEmpty) {
                        return "Your password must not be empty";
                      }
                      return null;
                    },
                    prefix: Icons.lock_outline,
                    suffixPressed: () {
                      UserRegisterCubit.get(context).changePasswordVisibility();
                    },
                    suffix: UserRegisterCubit.get(context).suffix,
                    isPassword: UserRegisterCubit.get(context).isPasswordShown,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: HexColor("E5E4E2"),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16),
                      child: Row(
                        children: [
                          Icon(
                            Icons.people_outline,
                            color: HexColor(green.toString()),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: DropdownButton<String>(
                              hint: Text("43".tr),
                              icon: Icon(Icons.arrow_drop_down_outlined, color: HexColor(green.toString())),

                              iconSize: 20,
                              dropdownColor: HexColor("E5E4E2"),
                              underline: SizedBox(),
                              items: listItem
                                  .map((item) => DropdownMenuItem<String>(
                                        child: Text(item,
                                            style: TextStyle(
                                                color: HexColor("6C6D72"),
                                                fontSize: 14)),
                                        value: item,

                                      ))
                                  .toList(),
                              onChanged: (item) =>
                                  UserRegisterCubit.get(context)
                                      .changeDropDownGender(item),
                              value: UserRegisterCubit.get(context)
                                  .selectedItemGender,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  defaultTextFieldPharmacy(
                      controller: ageController,
                      type: TextInputType.number,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Your Age must not be empty";
                        }
                        return null;
                      },
                      onSubmit: (value) {},
                      hint: "60".tr,
                      prefix: Icons.account_box_outlined),
                  SizedBox(
                    height: 16,
                  ),

                  Container(
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
                        SizedBox(width: 5,),
                        DropdownButton<String>(
                          menuMaxHeight: 300,

                          icon:  Icon(Icons.arrow_drop_down_outlined,color:
                          HexColor(green.toString())),
                          iconSize: 20,
                          dropdownColor: HexColor("E5E4E2"),
                          underline: const SizedBox(),
                          value: UserRegisterCubit.get(context).selectedAllCity,
                          onChanged:(value) {

                            setState(() {
                              UserRegisterCubit.get(context).changeSelectedCity(value!);
                            });

                          },
                          items: UserRegisterCubit.get(context).allCityDropDownItems,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 16,
                  ),
                  defaultTextFieldPharmacy(
                      controller: areaController,
                      type: TextInputType.text,
                      validate: ( value) {
                        if (value!.isEmpty) {
                          return "Your Area must not be empty";
                        }
                        return null;
                      },
                      onSubmit: (value) {},
                      hint: "61".tr,
                      prefix: Icons.area_chart_outlined),
                  SizedBox(
                    height: 16,
                  ),
                  defaultTextFieldPharmacy(
                      controller: locationController,
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
                  SizedBox(
                    height: 50,
                  ),
                  ConditionalBuilder(
                    condition: state is !UserLoadingSendEmailState ,
                    builder: (context) => newDefaultButton(
                        text: "17".tr,
                        background: HexColor(green.toString()),
                        function: () {


                          UserRegisterCubit.get(context).sendEmail(
                            email: emailController.text,
                            type: "63".tr

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
      );
    }));
  }
}
